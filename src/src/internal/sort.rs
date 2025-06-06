use crate::internal::alpm::{Alpm, PackageFrom};
use crate::internal::structs::Sorted;
use crate::internal::{clean, rpc};
use crate::Options;

#[tracing::instrument(level = "trace")]
pub async fn sort(input: &[String], options: Options) -> Sorted {
    let mut repo_packages: Vec<String> = vec![];
    let mut aur_packages: Vec<String> = vec![];
    let mut missing_packages: Vec<String> = vec![];

    let packages = clean(input);
    let alpm = Alpm::new().unwrap();

    tracing::debug!("Sorting: {:?}", packages.join(" "));
    let aur_query = rpc::rpcinfo_many(&packages).await.unwrap();

    for package in packages {
        let package_result = alpm.load(PackageFrom::SyncDb(package.clone()));

        if package_result.is_ok() {
            tracing::debug!("{} found in repos", package);
            repo_packages.push(package);
        } else if let Ok(pkgs) = alpm.group_packages(package.clone()) {
            tracing::debug!("{} group found in repos", package);
            pkgs.iter()
                .for_each(|pkg| repo_packages.push(pkg.name().to_string()));
        } else if aur_query.iter().any(|p| p.metadata.name == package) {
            tracing::debug!("{} found in AUR", package);
            aur_packages.push(package.to_string());
        } else {
            tracing::debug!("{} not found", package);
            missing_packages.push(package.to_string());
        }
    }

    Sorted::new(repo_packages, aur_packages, missing_packages)
}
