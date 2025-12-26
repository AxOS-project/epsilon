use crate::manifest::{Manifest, PackageActions, ServiceActions, RepoAdd};
use crate::internal::exit_code::AppExitCode;
use crate::{fl_crash, PacmanQueryBuilder, PacmanColor};
use crate::args::ManifestGenerateArgs;
use crate::error::SilentUnwrap;
use super::search;
use dialoguer::Confirm;
use std::path::PathBuf;
use std::fs;

#[tracing::instrument(level = "trace")]
pub async fn interpret_manifest(manifest_path: &PathBuf) {
    tracing::debug!("Interpreting config: {}", manifest_path.display());

    // user facing config is expected to be in YAML
    let yaml_config_str = match fs::read_to_string(manifest_path) {
        Ok(c) => c,
        Err(e) => {
            fl_crash!(
                AppExitCode::Other,
                "couldnt-find-file",
                file = manifest_path.to_string_lossy()
            )
        }
    };

    let yaml_config = Manifest::from_yaml_str(&yaml_config_str).unwrap();

    tracing::info!("CONF: {:#?}", yaml_config);
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
    if let Some(repos) = &args.exclude_repos {
        tracing::debug!(
            "Excluding repositories: {}",
            repos.join(", ")
        );
    } else {
        tracing::debug!("No repositories excluded");
    }

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

    let repo_add = RepoAdd::default();

    let services = ServiceActions {
        enable: args.enabled_services.clone().unwrap_or_else(Vec::new),
        disable: args.disabled_services.clone().unwrap_or_else(Vec::new),
    };

    let manifest = Manifest {
        packages,
        packages_aur,
        repo_add,
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