use serde::{Deserialize, Serialize};
use std::error::Error;
use std::collections::HashMap;

#[derive(Debug, Serialize, Deserialize, Default)]
pub struct Manifest {
    #[serde(default)]
    pub packages: PackageActions,

    #[serde(rename = "packages-aur", default)]
    pub packages_aur: PackageActions,

    #[serde(default)]
    pub repos: HashMap<String, RepoSpec>,

    #[serde(default)]
    pub services: ServiceActions,
}

#[derive(Debug, Serialize, Deserialize, Default)]
pub struct PackageActions {
    #[serde(default)]
    pub install: Vec<String>,
    #[serde(default)]
    pub remove: Vec<String>,
}

#[derive(Debug, Serialize, Deserialize, Default)]
pub struct RepoSpec {
    #[serde(default)]
    pub siglevel: Option<String>,
    pub server: String,
}

#[derive(Debug, Serialize, Deserialize, Default)]
pub struct ServiceActions {
    #[serde(default)]
    pub enable: Vec<String>,
    #[serde(default)]
    pub disable: Vec<String>,
}

impl Manifest {
    pub fn from_json_str(s: &str) -> Result<Self, Box<dyn Error>> {
        Ok(serde_json::from_str(s)?)
    }

    pub fn from_yaml_str(s: &str) -> Result<Self, Box<dyn Error>> {
        Ok(serde_yaml::from_str(s)?)
    }

    pub fn to_json_string(&self) -> Result<String, Box<dyn Error>> {
        Ok(serde_json::to_string_pretty(self)?)
    }

    pub fn to_yaml_string(&self) -> Result<String, Box<dyn Error>> {
        Ok(serde_yaml::to_string(self)?)
    }
}
