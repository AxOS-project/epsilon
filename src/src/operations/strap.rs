use crate::{fl_crash, AppExitCode};
use crate::args::StrapArgs;
use crate::error::SilentUnwrap;
use crate::builder::mount::ChrootMounts;
use crate::error::{AppResult, AppError};
use std::os::unix::fs::DirBuilderExt;
use std::process::Command;
use nix::mount::MsFlags;
use std::path::Path;

#[tracing::instrument(level = "trace")]
pub async fn strap(args: StrapArgs) {
    //* NOTE: Mount point is considered as root
    let mount_pnt = args.mount;
    let pkgs = args.packages;

    tracing::info!("Creating install root at {}", &mount_pnt.display());
    create_dirs(&mount_pnt).await.silent_unwrap(AppExitCode::FailedCreatingPaths);

    // Mount API filesystems
    tracing::info!("Setting up chroot");
    if let Err(e) = setup_chroot(&mount_pnt).await {
        fl_crash!(
            AppExitCode::MountError,
            "failed-mount",
            error = e.to_string()
        );
    }

    tracing::info!("Initializing pacman keyrings");
    initialize_keyring(&mount_pnt, args.init_keyring, args.avoid_keyring_copy).await;

    // Install packages
    tracing::info!("Installing packages to {}", &mount_pnt.display());
    let mut pacman_args = vec![
        "-Sy".to_string(),
        "--config".to_string(),
        "/etc/pacman.conf".to_string(),
        "--noconfirm".to_string(),
    ];
    pacman_args.extend(pkgs);

    let install_result = Command::new("unshare")
        .args(["--fork", "--pid"])
        .arg("pacman")
        .arg("-r")
        .arg(&mount_pnt)
        .args(&pacman_args)
        .status()
        .unwrap_or_else(|e| panic!("failed to execute unshare: {}", e));

    if !install_result.success() {
        fl_crash!(AppExitCode::PacmanError, "failed-pkg-install");
    }

    // Copy Mirrorlist
    if !args.avoid_mirrorlist {
        copy_path(
            Path::new("/etc/pacman.d/mirrorlist"),
            &mount_pnt.join("etc/pacman.d/"),
            true,
        ).silent_unwrap(AppExitCode::Other);
    }

    // Copy pacman configuration
    if args.copy_conf {
        copy_path(
            Path::new("/etc/pacman.conf"),
            &mount_pnt.join("etc/pacman.conf"),
            true,
        ).silent_unwrap(AppExitCode::Other);
    }
}

async fn create_dirs(root: &Path) -> AppResult<()> {
    let mut b755 = std::fs::DirBuilder::new();
    b755.recursive(true).mode(0o755);

    let mut b1777 = std::fs::DirBuilder::new();
    b1777.recursive(true).mode(0o1777);

    let mut b555 = std::fs::DirBuilder::new();
    b555.recursive(true).mode(0o555);

    for dir in &["var/cache/pacman/pkg", "var/lib/pacman", "var/log", "dev", "run", "etc/pacman.d"] {
        b755.create(root.join(dir))?;
    }
    b1777.create(root.join("tmp"))?;
    b555.create(root.join("sys"))?;
    b555.create(root.join("proc"))?;

    Ok(())
}

async fn initialize_keyring(root: &Path, init_keyring: bool, avoid_keyring_copy: bool) {
    let gnupg_path = root.join("etc/pacman.d/gnupg/");
    let host_gnupg_path = Path::new("/etc/pacman.d/gnupg");

    if !gnupg_path.is_dir() {
        if init_keyring {
            let result = Command::new("pacman-key")
                .arg("--gpgdir")
                .arg(&gnupg_path)
                .arg("--init")
                .status()
                .expect("failed to spawn pacman-key");

            if !result.success() {
                fl_crash!(AppExitCode::PacmanError, "keyring-failed");
            }
        } else if !avoid_keyring_copy && host_gnupg_path.is_dir() {
            let result = copy_path(
                host_gnupg_path,
                &gnupg_path,
                false,
            );

            if let Err(_) = result {
                fl_crash!(AppExitCode::PacmanError, "keyring-copy-failed");
            }
        }
    }
}

async fn setup_chroot<P: AsRef<Path>>(root: P) -> nix::Result<()> {
    let root = root.as_ref();
    let mut chroot_mounts = ChrootMounts::new();

    tracing::debug!("Mounting proc");
    chroot_mounts.add_mount(
        Some("proc"),
        root.join("proc"),
        Some("proc"),
        MsFlags::MS_NOSUID | MsFlags::MS_NOEXEC | MsFlags::MS_NODEV,
        None,
    )?;

    tracing::debug!("Mounting sys");
    chroot_mounts.add_mount(
        Some("sys"),
        root.join("sys"),
        Some("sysfs"),
        MsFlags::MS_NOSUID
            | MsFlags::MS_NOEXEC
            | MsFlags::MS_NODEV
            | MsFlags::MS_RDONLY,
        None,
    )?;

    tracing::debug!("Mounting efivars");
    let efivars = root.join("sys/firmware/efi/efivars");
    let _ = chroot_mounts.maybe_add_mount(
        efivars.exists(),
        Some("efivarfs"),
        &efivars,
        Some("efivarfs"),
        MsFlags::MS_NOSUID | MsFlags::MS_NOEXEC | MsFlags::MS_NODEV,
        None,
    );

    tracing::debug!("Mounting udev");
    chroot_mounts.add_mount(
        Some("udev"),
        root.join("dev"),
        Some("devtmpfs"),
        MsFlags::MS_NOSUID,
        Some("mode=0755"),
    )?;

    tracing::debug!("Mounting devpts");
    chroot_mounts.add_mount(
        Some("devpts"),
        root.join("dev/pts"),
        Some("devpts"),
        MsFlags::MS_NOSUID | MsFlags::MS_NOEXEC,
        Some("mode=0620,gid=5"),
    )?;

    tracing::debug!("Mounting shm");
    chroot_mounts.add_mount(
        Some("shm"),
        root.join("dev/shm"),
        Some("tmpfs"),
        MsFlags::MS_NOSUID | MsFlags::MS_NODEV,
        Some("mode=1777"),
    )?;

    tracing::debug!("Mounting run");
    chroot_mounts.add_mount(
        Some("/run"),
        root.join("run"),
        None,
        MsFlags::MS_BIND,
        None,
    )?;

    chroot_mounts.add_mount(
        None::<&str>,
        &root.join("run"),
        None::<&str>,
        MsFlags::MS_PRIVATE,
        None::<&str>,
    )?;

    tracing::debug!("Mounting tmp");
    chroot_mounts.add_mount(
        Some("tmp"),
        root.join("tmp"),
        Some("tmpfs"),
        MsFlags::MS_NOSUID | MsFlags::MS_NODEV | MsFlags::MS_STRICTATIME,
        Some("mode=1777"),
    )?;

    Ok(())
}

fn copy_path(
    src: &Path, dst: &Path, 
    preserve_ownership: bool
) -> AppResult<()> {
    let mut args: Vec<&str> = vec!["-a"];

    if !preserve_ownership {
        args.push("--no-preserve=ownership");
    }

    let status = Command::new("cp")
        .args(&args)
        .arg(src)
        .arg(dst)
        .status()?;

    if !status.success() {
        return Err(AppError::Other(format!(
                "cp {:?} -> {:?} failed with exit code: {:?}",
                src, dst, status.code()
            )))
    }

    Ok(())
}