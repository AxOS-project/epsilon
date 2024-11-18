pub use clean::*;
pub use detect::*;
pub use sort::*;
pub use sudoloop::*;

mod clean;
pub mod commands;
pub mod config;
pub mod dependencies;
mod detect;
pub mod exit_code;
pub mod rpc;
mod sort;
pub mod structs;
#[macro_use]
pub mod utils;
pub mod alpm;
pub mod i18n;
mod sudoloop;

#[macro_export]
macro_rules! uwu {
    ($x:expr) => {{
        String::from($x)
            .replace("l", "w")
            .replace("L", "W")
            .replace("r", "w")
            .replace("R", "W")
            .replace("na", "nya")
            .replace("Na", "Nya")
            .replace("NA", "NYA")
    }};
}

pub fn uwu_enabled() -> bool {
    let config = config::Config::get();
    if let Some(uwu) = &config.extra {
        uwu.uwu.unwrap_or(false)
    } else {
        false
    }
}

/// Checks if we're running in a tty. If we do we can assume that
/// the output can safely be colorized.
pub fn is_tty() -> bool {
    (unsafe { libc::isatty(libc::STDIN_FILENO) } != 0)
}
