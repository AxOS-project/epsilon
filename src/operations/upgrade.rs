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
    if args.repo {
        upgrade_repo(options).await;
    }
    if args.aur {
        upgrade_aur(options).await;
    }
    if !args.aur && !args.repo {
        upgrade_repo(options).await;
        upgrade_aur(options).await;
    }
}

#[tracing::instrument(level = "trace")]
async fn upgrade_repo(options: Options) {
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
