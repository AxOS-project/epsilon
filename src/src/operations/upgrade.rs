use alpm::vercmp;

use crate::args::UpgradeArgs;
use crate::builder::pacman::{PacmanColor, PacmanQueryBuilder, PacmanUpgradeBuilder};
use crate::error::SilentUnwrap;
use crate::internal::detect;
use crate::internal::exit_code::AppExitCode;
use crate::internal::rpc::rpcinfo;
use crate::operations::aur_install::aur_install;
use crate::{fl, fl_error, fl_info, fl_warn, multi_select, Options};

/// Upgrades all installed packages
#[tracing::instrument(level = "trace")]
pub async fn upgrade(args: UpgradeArgs, options: Options) {
    if args.replace_snapshot {
        delete_snapshot(options).await;
    }

    if args.with_snapshot {
        create_snapshot(options).await;
    }

    if args.repo {
        upgrade_repo(&args, options).await;
    }

    if args.aur {
        upgrade_aur(options).await;
    }

    if !args.aur && !args.repo {
        upgrade_repo(&args, options).await;
        upgrade_aur(options).await;
    }
}

#[tracing::instrument(level = "trace")]
async fn create_snapshot(options: Options) {
    tracing::debug!("Creating snapshot before upgrade...");

    let result = std::process::Command::new("sudo")
    .args(["timeshift", "--create", "--comments", "Snapshot before upgrade [epsilon]"])
    .status(); 

    match result {
        Ok(status) if status.success() => {
            fl_info!("snapshot-created-successfully");
        }
        Ok(status) => {
            fl_info!("snapshot-tool-exited-status", status = status.to_string());
            std::process::exit(AppExitCode::PacmanError as i32);
        }
        Err(e) => {
            fl_error!("failed-to-run-snapshot-tool", error = e.to_string());
            fl_info!("timeshift-not-installed");
            std::process::exit(AppExitCode::PacmanError as i32);
        }
    }
}

#[tracing::instrument(level = "trace")]
async fn delete_snapshot(_options: Options) {
    tracing::debug!("Deleting snapshot with [epsilon]...");

    let output = std::process::Command::new("sudo")
        .args(["timeshift", "--list"])
        .output();

    let output = match output {
        Ok(out) if out.status.success() => out,
        Ok(out) => {
            fl_error!("timeshift-list-nonzero-status", error = String::from_utf8_lossy(&out.stderr));
            std::process::exit(AppExitCode::PacmanError as i32);
        }
        Err(e) => {
            fl_error!("failed-to-run-snapshot-list-tool", error = e.to_string());
            std::process::exit(AppExitCode::PacmanError as i32);
        }
    };

    let stdout = String::from_utf8_lossy(&output.stdout);
    tracing::debug!("Snapshot list output: {}", stdout);

    let snapshot_line = stdout
        .lines()
        .rev() // gets the latest epsilon snapshot
        .find(|line| line.contains("[epsilon]"));

    match snapshot_line {
        Some(line) => {
            let snapshot_name = line
                .split_whitespace()
                .nth(2)
                .unwrap_or("");


            if snapshot_name.is_empty() {
                fl_error!("could-not-parse-snapshot-id", line = line.to_string());
                std::process::exit(AppExitCode::PacmanError as i32);
            }

            let delete_result = std::process::Command::new("sudo")
                .args(["timeshift", "--delete", "--snapshot", snapshot_name])
                .status();

            match delete_result {
                Ok(status) if status.success() => {
                    fl_info!("snapshot-removed-successfully");
                }
                Ok(status) => {
                    fl_info!("snapshot-tool-exited-status", status = status.to_string());
                    std::process::exit(AppExitCode::PacmanError as i32);
                }
                Err(e) => {
                    fl_error!("failed-to-run-snapshot-tool", error = e.to_string());
                    std::process::exit(AppExitCode::PacmanError as i32);
                }
            }
        }
        None => {
            fl_info!("no-epsilon-snapshot-found");
        }
    }
}

#[tracing::instrument(level = "trace")]
async fn upgrade_repo(args: &UpgradeArgs, options: Options) {
    let noconfirm = options.noconfirm;
    let quiet = options.quiet;

    tracing::debug!("Upgrading repo packages");

    let result = PacmanUpgradeBuilder::default()
        .no_confirm(noconfirm)
        .quiet(quiet)
        .upgrade()
        .await;

    if result.is_err() {
        fl_error!("failed-upgrade-repo-pkgs");
        fl_info!("exiting");
        if args.delete_snapshot_onfail { // delete the saved snapshot if the argument is called.
            delete_snapshot(options).await;
        }
        std::process::exit(AppExitCode::PacmanError as i32);
    } else {
        fl_info!("success-upgrade-repo-pkgs");
    }
}

#[tracing::instrument(level = "trace")]
async fn upgrade_aur(options: Options) {
    tracing::debug!("Upgrading AUR packages");
    fl_info!("aur-check-upgrades");

    let non_native_pkgs = PacmanQueryBuilder::foreign()
        .color(PacmanColor::Never)
        .query_with_output()
        .await
        .silent_unwrap(AppExitCode::PacmanError);

    tracing::debug!("aur packages: {non_native_pkgs:?}");
    let mut aur_upgrades = vec![];

    for pkg in non_native_pkgs {
        let remote_package = rpcinfo(&pkg.name)
            .await
            .silent_unwrap(AppExitCode::RpcError);

        if let Some(remote_package) = remote_package {
            if vercmp(remote_package.metadata.version.clone(), pkg.version.clone()).is_gt() {
                tracing::debug!(
                    "local version: {}, remote version: {}",
                    pkg.version,
                    remote_package.metadata.version
                );
                aur_upgrades.push(pkg.name);
            }
        } else {
            fl_warn!("couldnt-find-remote-pkg", pkg = pkg.name);
        }
    }

    if aur_upgrades.is_empty() {
        fl_info!("no-upgrades-aur-package");
    }

    // :( bad
    let mut to_upgrade = Vec::new();
    if aur_upgrades.is_empty() {
        to_upgrade = aur_upgrades
    } else {
        let upgrade = multi_select!(aur_upgrades.clone(), "{}", fl!("select-pkgs-upgrade"));
        for pkg in upgrade.into_iter().filter_map(|i| aur_upgrades.get(i)) {
            to_upgrade.push(pkg.clone());
        }
    };

    if !to_upgrade.is_empty() {
        let options = Options {
            upgrade: true,
            ..options
        };
        aur_install(to_upgrade, options).await;
    } else {
        fl_info!("no-upgrades-aur-package");
    }

    fl_info!("scanning-for-pacnew");
    detect().await;
}
