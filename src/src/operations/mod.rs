pub use aur_install::*;
pub use clean::*;
pub use install::*;
pub use search::{aur_search, repo_search as search, SearchBy};
pub use uninstall::*;
pub use upgrade::*;
pub use sync::*;

mod aur_install;
mod clean;
mod install;
mod search;
mod uninstall;
mod upgrade;

mod sync;