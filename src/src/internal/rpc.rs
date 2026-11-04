use std::fmt::Display;
use serde::{Deserialize, Serialize};

use crate::error::AppResult;

pub const URL: &str = "https://aur.archlinux.org/";
pub const RPC_BASE_URL: &str = "https://aur.archlinux.org/rpc/v5";

fn get_client() -> reqwest::Client {
    reqwest::Client::builder()
        .user_agent(concat!("epsilon/", env!("CARGO_PKG_VERSION")))
        .build()
        .unwrap_or_else(|_| reqwest::Client::new())
}

#[derive(Debug, thiserror::Error)]
pub enum RPCError {
    #[error("HTTP Error {0}")]
    HTTP(#[from] reqwest::Error),

    #[error("RPC Error {0}")]
    RPC(String),
}

/// Represents a field to search by in the AUR RPC
#[derive(Debug, Clone, Copy, PartialEq, Eq, Hash)]
#[allow(dead_code)]
pub enum SearchField {
    Name,
    NameDesc,
    Maintainer,
    Depends,
    MakeDepends,
    OptDepends,
    CheckDepends,
    Submitter,
    Provides,
    Conflicts,
    Replaces,
    Keywords,
    Groups,
    CoMaintainers,
}

impl SearchField {
    pub fn as_str(&self) -> &'static str {
        match self {
            Self::Name => "name",
            Self::NameDesc => "name-desc",
            Self::Maintainer => "maintainer",
            Self::Depends => "depends",
            Self::MakeDepends => "makedepends",
            Self::OptDepends => "optdepends",
            Self::CheckDepends => "checkdepends",
            Self::Submitter => "submitter",
            Self::Provides => "provides",
            Self::Conflicts => "conflicts",
            Self::Replaces => "replaces",
            Self::Keywords => "keywords",
            Self::Groups => "groups",
            Self::CoMaintainers => "comaintainers",
        }
    }
}

impl Display for SearchField {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        write!(f, "{}", self.as_str())
    }
}

fn deserialize_optional_u64<'de, D>(deserializer: D) -> Result<Option<u64>, D::Error>
where
    D: serde::Deserializer<'de>,
{
    use serde::de;

    struct OptU64Visitor;
    impl<'de> de::Visitor<'de> for OptU64Visitor {
        type Value = Option<u64>;

        fn expecting(&self, formatter: &mut std::fmt::Formatter) -> std::fmt::Result {
            formatter.write_str("null, integer, or string representing an integer")
        }

        fn visit_none<E>(self) -> Result<Self::Value, E>
        where
            E: de::Error,
        {
            Ok(None)
        }

        fn visit_some<D>(self, deserializer: D) -> Result<Self::Value, D::Error>
        where
            D: serde::Deserializer<'de>,
        {
            deserializer.deserialize_any(self)
        }

        fn visit_unit<E>(self) -> Result<Self::Value, E>
        where
            E: de::Error,
        {
            Ok(None)
        }

        fn visit_u64<E>(self, v: u64) -> Result<Self::Value, E>
        where
            E: de::Error,
        {
            Ok(Some(v))
        }

        fn visit_i64<E>(self, v: i64) -> Result<Self::Value, E>
        where
            E: de::Error,
        {
            Ok(if v >= 0 { Some(v as u64) } else { None })
        }

        fn visit_str<E>(self, v: &str) -> Result<Self::Value, E>
        where
            E: de::Error,
        {
            if v.is_empty() {
                Ok(None)
            } else {
                v.parse::<u64>().map(Some).map_err(de::Error::custom)
            }
        }
    }

    deserializer.deserialize_option(OptU64Visitor)
}

/// Represents the basic information about a package
/// that can be retrieved from a search or by fetching package info.
#[derive(Clone, Debug, Deserialize, Serialize)]
#[serde(rename_all = "PascalCase")]
pub struct PackageMetadata {
    #[serde(default)]
    pub description: Option<String>,
    #[serde(default)]
    pub first_submitted: u64,
    #[serde(default, alias = "ID")]
    pub id: u32,
    #[serde(default)]
    pub last_modified: u64,
    #[serde(default)]
    pub maintainer: Option<String>,
    #[serde(default)]
    pub name: String,
    #[serde(default)]
    pub num_votes: u32,
    #[serde(default, deserialize_with = "deserialize_optional_u64")]
    pub out_of_date: Option<u64>,
    #[serde(default)]
    pub package_base: String,
    #[serde(default, alias = "PackageBaseID")]
    pub package_base_id: u32,
    #[serde(default)]
    pub popularity: f64,
    #[serde(default, alias = "URL")]
    pub url: Option<String>,
    #[serde(default, alias = "URLPath")]
    pub url_path: Option<String>,
    #[serde(default)]
    pub version: String,
}

/// Represents the detailed information about a package that can
/// be retrieved with the info RPC.
#[derive(Clone, Debug, Deserialize, Serialize)]
#[serde(from = "PackageInfoRaw", into = "PackageInfoRaw")]
pub struct PackageInfo {
    pub metadata: PackageMetadata,
    pub keywords: Vec<String>,
    pub license: Vec<String>,
    pub depends: Vec<String>,
    pub make_depends: Vec<String>,
    pub opt_depends: Vec<String>,
    pub check_depends: Vec<String>,
    pub conflicts: Vec<String>,
    pub provides: Vec<String>,
    pub replaces: Vec<String>,
}

#[derive(Clone, Debug, Deserialize, Serialize)]
#[serde(rename_all = "PascalCase")]
pub(crate) struct PackageInfoRaw {
    #[serde(default)]
    pub keywords: Vec<String>,
    #[serde(default)]
    pub license: Vec<String>,
    #[serde(default)]
    pub depends: Vec<String>,
    #[serde(default)]
    pub opt_depends: Vec<String>,
    #[serde(default)]
    pub check_depends: Vec<String>,
    #[serde(default)]
    pub make_depends: Vec<String>,
    #[serde(default)]
    pub conflicts: Vec<String>,
    #[serde(default)]
    pub provides: Vec<String>,
    #[serde(default)]
    pub replaces: Vec<String>,
    #[serde(default)]
    pub description: Option<String>,
    #[serde(default)]
    pub first_submitted: u64,
    #[serde(default, alias = "ID")]
    pub id: u32,
    #[serde(default)]
    pub last_modified: u64,
    #[serde(default)]
    pub maintainer: Option<String>,
    #[serde(default)]
    pub name: String,
    #[serde(default)]
    pub num_votes: u32,
    #[serde(default, deserialize_with = "deserialize_optional_u64")]
    pub out_of_date: Option<u64>,
    #[serde(default)]
    pub package_base: String,
    #[serde(default, alias = "PackageBaseID")]
    pub package_base_id: u32,
    #[serde(default)]
    pub popularity: f64,
    #[serde(default, alias = "URL")]
    pub url: Option<String>,
    #[serde(default, alias = "URLPath")]
    pub url_path: Option<String>,
    #[serde(default)]
    pub version: String,
}

impl From<PackageInfoRaw> for PackageInfo {
    fn from(info: PackageInfoRaw) -> Self {
        PackageInfo {
            metadata: PackageMetadata {
                description: info.description,
                first_submitted: info.first_submitted,
                id: info.id,
                last_modified: info.last_modified,
                maintainer: info.maintainer,
                name: info.name,
                num_votes: info.num_votes,
                out_of_date: info.out_of_date,
                package_base: info.package_base,
                package_base_id: info.package_base_id,
                popularity: info.popularity,
                url: info.url,
                url_path: info.url_path,
                version: info.version,
            },
            keywords: info.keywords,
            license: info.license,
            depends: info.depends,
            opt_depends: info.opt_depends,
            make_depends: info.make_depends,
            check_depends: info.check_depends,
            conflicts: info.conflicts,
            provides: info.provides,
            replaces: info.replaces,
        }
    }
}

impl From<PackageInfo> for PackageInfoRaw {
    fn from(info: PackageInfo) -> Self {
        PackageInfoRaw {
            keywords: info.keywords,
            license: info.license,
            depends: info.depends,
            opt_depends: info.opt_depends,
            check_depends: info.check_depends,
            make_depends: info.make_depends,
            conflicts: info.conflicts,
            provides: info.provides,
            replaces: info.replaces,
            description: info.metadata.description,
            first_submitted: info.metadata.first_submitted,
            id: info.metadata.id,
            last_modified: info.metadata.last_modified,
            maintainer: info.metadata.maintainer,
            name: info.metadata.name,
            num_votes: info.metadata.num_votes,
            out_of_date: info.metadata.out_of_date,
            package_base: info.metadata.package_base,
            package_base_id: info.metadata.package_base_id,
            popularity: info.metadata.popularity,
            url: info.metadata.url,
            url_path: info.metadata.url_path,
            version: info.metadata.version,
        }
    }
}

#[derive(Deserialize)]
struct ErrorResponse {
    #[serde(default)]
    error: Option<String>,
}

/// Represents the basic AUR response structure
#[derive(Clone, Debug, Deserialize, Serialize)]
#[serde(bound(deserialize = "T: serde::de::DeserializeOwned"))]
pub(crate) struct AURResponse<T> {
    #[serde(default)]
    pub version: u32,
    #[serde(default, alias = "type")]
    pub response_type: String,
    #[serde(default)]
    pub resultcount: u32,
    #[serde(default = "Vec::new")]
    pub results: Vec<T>,
    #[serde(default)]
    pub error: Option<String>,
}

async fn parse_response<T: serde::de::DeserializeOwned>(
    response: reqwest::Response,
) -> Result<Vec<T>, RPCError> {
    if !response.status().is_success() {
        let http_err = response.error_for_status_ref().unwrap_err();
        if let Ok(body) = response.json::<ErrorResponse>().await {
            if let Some(err) = body.error {
                return Err(RPCError::RPC(err));
            }
        }
        return Err(RPCError::HTTP(http_err));
    }

    let body: AURResponse<T> = response.json().await?;
    if let Some(err) = body.error {
        return Err(RPCError::RPC(err));
    }

    Ok(body.results)
}

/// Returns information about the given list of packages
#[tracing::instrument(level = "debug", skip_all)]
pub async fn info<I, S>(packages: I) -> Result<Vec<PackageInfo>, RPCError>
where
    I: IntoIterator<Item = S>,
    S: AsRef<str>,
{
    let pkgs: Vec<String> = packages
        .into_iter()
        .map(|p| p.as_ref().to_string())
        .collect();

    if pkgs.is_empty() {
        return Ok(Vec::new());
    }

    if pkgs.len() == 1 {
        let mut url = reqwest::Url::parse(URL).unwrap();
        url.path_segments_mut().unwrap().extend(&["rpc", "v5", "info", &pkgs[0]]);
        let response = get_client().get(url).send().await?;
        parse_response::<PackageInfo>(response).await
    } else if pkgs.len() <= 200 {
        let url = format!("{RPC_BASE_URL}/info");
        let params: Vec<(&str, &str)> = pkgs.iter().map(|p| ("arg[]", p.as_str())).collect();
        let response = get_client().post(url).form(&params).send().await?;
        parse_response::<PackageInfo>(response).await
    } else {
        let mut all_results = Vec::new();
        for chunk in pkgs.chunks(200) {
            let url = format!("{RPC_BASE_URL}/info");
            let params: Vec<(&str, &str)> = chunk.iter().map(|p| ("arg[]", p.as_str())).collect();
            let response = get_client().post(url).form(&params).send().await?;
            let mut results = parse_response::<PackageInfo>(response).await?;
            all_results.append(&mut results);
        }
        Ok(all_results)
    }
}

/// Searches for packages by name
#[tracing::instrument(level = "debug", skip_all)]
pub async fn search<S: AsRef<str>>(keywords: S) -> Result<Vec<PackageMetadata>, RPCError> {
    search_by(SearchField::Name, keywords).await
}

/// Searches for packages by a specific field
#[tracing::instrument(level = "debug", skip_all)]
pub async fn search_by<S: AsRef<str>>(
    field: SearchField,
    keywords: S,
) -> Result<Vec<PackageMetadata>, RPCError> {
    let term = keywords.as_ref();
    if term.trim().is_empty() {
        return Ok(Vec::new());
    }

    let mut url = reqwest::Url::parse(URL).unwrap();
    url.path_segments_mut().unwrap().extend(&["rpc", "v5", "search", term]);
    url.query_pairs_mut().append_pair("by", field.as_str());

    let response = get_client().get(url).send().await?;
    parse_response::<PackageMetadata>(response).await
}

/// Returns a list of package names starting with the given query
#[tracing::instrument(level = "debug", skip_all)]
#[allow(dead_code)]
pub async fn suggest<S: AsRef<str>>(query: S) -> Result<Vec<String>, RPCError> {
    let term = query.as_ref();
    if term.trim().is_empty() {
        return Ok(Vec::new());
    }

    let mut url = reqwest::Url::parse(URL).unwrap();
    url.path_segments_mut().unwrap().extend(&["rpc", "v5", "suggest", term]);

    let response = get_client().get(url).send().await?.error_for_status()?;
    Ok(response.json().await?)
}

/// Returns a list of package base names starting with the given query
#[tracing::instrument(level = "debug", skip_all)]
#[allow(dead_code)]
pub async fn suggest_pkgbase<S: AsRef<str>>(query: S) -> Result<Vec<String>, RPCError> {
    let term = query.as_ref();
    if term.trim().is_empty() {
        return Ok(Vec::new());
    }

    let mut url = reqwest::Url::parse(URL).unwrap();
    url.path_segments_mut().unwrap().extend(&["rpc", "v5", "suggest-pkgbase", term]);

    let response = get_client().get(url).send().await?.error_for_status()?;
    Ok(response.json().await?)
}

pub async fn rpcinfo(pkg: &str) -> AppResult<Option<PackageInfo>> {
    let packages = info([pkg]).await?;
    Ok(packages.into_iter().next())
}

pub async fn rpcinfo_many(pkgs: &[String]) -> AppResult<Vec<PackageInfo>> {
    let results = info(pkgs).await?;
    Ok(results)
}

pub async fn rpcsearch(
    query: String,
    by_field: Option<SearchField>,
) -> AppResult<Vec<PackageMetadata>> {
    let search_results = if let Some(field) = by_field {
        search_by(field, query).await?
    } else {
        search(query).await?
    };

    Ok(search_results)
}
