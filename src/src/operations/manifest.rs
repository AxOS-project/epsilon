use crate::manifest::{Manifest, PackageActions, ServiceActions};
use crate::internal::exit_code::AppExitCode;
use crate::{fl_crash, PacmanQueryBuilder, PacmanColor, Options};
use crate::args::ManifestGenerateArgs;
use crate::error::SilentUnwrap;
use super::{install, uninstall, aur_install};
use std::collections::HashMap;
use std::process::{Command, Stdio};
use dialoguer::Confirm;
use std::path::PathBuf;
use std::io::Write;
use std::fs;


fn append_repo_sudo(name: &str, repo_block: &str) {
    // Backup original
    let path = "/etc/pacman.conf";
    let backup_path = "/etc/pacman.conf.bak";

    tracing::info!("Creating backup at {}", backup_path);

    let status = Command::new("sudo")
        .arg("cp")
        .arg(path)
        .arg(backup_path)
        .status()
        .unwrap_or_else(|_| fl_crash!(
            AppExitCode::Other,
            "failed-to-backup-repo-file",
            file = path
        ));

    if !status.success() {
        fl_crash!(
            AppExitCode::Other,
            "failed-to-backup-repo-file",
            file = path
        );
    }

    // Append via sudo tee
    let mut child = Command::new("sudo")
        .arg("tee")
        .arg("-a") // append
        .arg(path)
        .stdin(Stdio::piped())
        .stdout(Stdio::null())
        .stderr(Stdio::null())
        .spawn()
        .unwrap_or_else(|_| fl_crash!(
            AppExitCode::Other,
            "failed-to-start-sudo-tee",
            file = path
        ));

    {
        let stdin = child.stdin.as_mut().unwrap();
        stdin.write_all(repo_block.as_bytes()).unwrap_or_else(|_| fl_crash!(
            AppExitCode::Other,
            "failed-to-write-to-sudo-tee",
            repo = name
        ));
    }

    let status = child.wait().unwrap_or_else(|_| fl_crash!(
        AppExitCode::Other,
        "failed-to-wait-for-sudo-tee",
        repo = name
    ));

    if !status.success() {
        fl_crash!(
            AppExitCode::Other,
            "sudo-tee-exited-with-error",
            repo = name
        );
    }
}

#[tracing::instrument(level = "trace")]
pub async fn interpret_manifest(
    manifest_path: &PathBuf, 
    install_all: bool,
    noconfirm: &bool, 
    quiet: &bool,
) {
    tracing::debug!("Interpreting config: {}", manifest_path.display());

    // user facing config is expected to be in YAML
    let yaml_config = match fs::read_to_string(manifest_path) {
        Ok(c) => c,
        Err(_) => {
            fl_crash!(
                AppExitCode::Other,
                "couldnt-find-file",
                file = manifest_path.to_string_lossy()
            )
        }
    };

    let config = Manifest::from_yaml_str(&yaml_config).unwrap();
    let options = Options {
        noconfirm: noconfirm.clone(),
        quiet: quiet.clone(),
        asdeps: false,
        upgrade: false,
        needed: !install_all,
    };

    // Install & Uninstall
    tracing::info!(
        "Installing {} repo packages, {} AUR packages",
        config.packages.install.len(),
        config.packages_aur.install.len()
    );

    if !config.packages.install.is_empty() {
        install::install(config.packages.install, options).await;
    }

    if !config.packages_aur.install.is_empty() {
        aur_install::aur_install(config.packages_aur.install, options).await;
    }

    tracing::info!(
        "Removing {} repo packages, {} AUR packages",
        config.packages.remove.len(),
        config.packages_aur.remove.len()
    );

    if !config.packages.remove.is_empty() {
        uninstall::uninstall(config.packages.remove, options).await;
    }

    if !config.packages_aur.remove.is_empty() {
        uninstall::uninstall(config.packages_aur.remove, options).await;
    }

    // Handling repos to be added
    if config.repos.is_empty() {
        tracing::debug!("No repositories defined in manifest");
    } else {
        tracing::info!(
            "Applying {} repository definitions",
            config.repos.len()
        );

        for (name, repo) in &config.repos {
            tracing::info!(
                "Configuring repo '{}': {}",
                name,
                repo.server
            );

            let exists = Command::new("pacman-conf")
                .arg("--repo")
                .arg(name)
                .stdout(Stdio::null())
                .stderr(Stdio::null())
                .status()
                .map(|s| s.success())
                .unwrap_or(false);

            if exists {
                tracing::info!("Repo '{}' already exists, skipping", name);
                continue;
            }

            tracing::info!("Writing repo '{}'", name);
            let repo_block = format!(
                "[{}]\nSigLevel = {}\nServer = {}\n\n",
                name,
                repo.siglevel.as_deref().unwrap_or("Optional TrustAll"),
                repo.server
            );

            append_repo_sudo(name, &repo_block);
        }
    }

    // Handling service enable/disable
    for e_service in config.services.enable {
        tracing::warn!("TODO: Enable service");
    }

    for d_service in config.services.disable {
        tracing::warn!("TODO: Disable service");
    }
}

#[tracing::instrument(level = "trace")]
pub async fn generate_manifest(args: &ManifestGenerateArgs, noconfirm: &bool) {
    if !noconfirm {
        let proceed = Confirm::new()
            .with_prompt(
                "This will generate a manifest file based on the current state. Continue?"
            )
            .default(false)
            .interact()
            .unwrap_or(false);

        if !proceed {
            fl_crash!(
                AppExitCode::UserCancellation,
                "manifest-abort"
            )
        }
    }

    tracing::info!("Generating epsilon manifest...");
    if args.include_aur {
        tracing::warn!("User enabled AUR inclusion, which may be unstable.");
    }

    let repos = PacmanQueryBuilder::native()
        .color(PacmanColor::Never)
        .explicit(args.user_installed)
        .query_with_output()
        .await
        .silent_unwrap(AppExitCode::PacmanError);

    let packages = PackageActions {
        install: repos.iter().map(|p| p.name.clone()).collect(),
        remove: vec![],
    };

    let packages_aur = if args.include_aur {
        let aur = PacmanQueryBuilder::foreign()
            .color(PacmanColor::Never)
            .explicit(args.user_installed)
            .query_with_output()
            .await
            .silent_unwrap(AppExitCode::PacmanError);

        PackageActions {
            install: aur.iter().map(|p| p.name.clone()).collect(),
            remove: vec![],
        }
    } else {
        PackageActions {
            install: vec![],
            remove: vec![],
        }
    };

    let repos = HashMap::new();

    let services = ServiceActions {
        enable: args.enabled_services.clone().unwrap_or_else(Vec::new),
        disable: args.disabled_services.clone().unwrap_or_else(Vec::new),
    };

    let manifest = Manifest {
        packages,
        packages_aur,
        repos,
        services,
    };

    let yaml_str = manifest.to_yaml_string().unwrap();

    if args.view_json {
        let json_str = manifest.to_json_string().unwrap();

        tracing::info!("=== Generated JSON ===\n{}\n=== Generated JSON ===", json_str);

        let proceed = Confirm::new()
            .with_prompt("Proceed with this manifest?")
            .default(false)
            .interact()
            .unwrap_or(false);

        if !proceed {
            fl_crash!(
                AppExitCode::UserCancellation,
                "manifest-abort"
            );
        }
    }

    let path = &args.out_path;
    std::fs::write(&path, yaml_str).unwrap_or_else(|_| {
        fl_crash!(
            AppExitCode::Other,
            "failed-to-write-manifest",
            file = path.to_string_lossy()
        )
    });
    tracing::info!("Manifest written to {}", path.display());
}