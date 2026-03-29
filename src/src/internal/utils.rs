use std::fs;
use std::path::Path;
use std::process::exit;

use directories::ProjectDirs;
use textwrap::wrap;

use crate::{internal::exit_code::AppExitCode, logging::get_logger};
use lazy_static::lazy_static;

use crate::error::{AppError, SilentUnwrap};

#[macro_export]
/// Macro for printing a message and destructively exiting
macro_rules! crash {
    ($exit_code:expr, $($arg:tt)+) => {
        $crate::internal::utils::log_and_crash(format!($($arg)+), $exit_code)
    }
}

#[macro_export]
/// Macro for printing a message and destructively exiting
macro_rules! fl_crash {
    ($exit_code:expr, $message_id:literal) =>  {
        $crate::internal::utils::log_and_crash($crate::fl!($message_id), $exit_code)
    };

    ($exit_code:expr, $message_id:literal, $($arg:tt)*) => {
        $crate::internal::utils::log_and_crash($crate::fl!($message_id, $($arg)*), $exit_code)
    };
}

#[macro_export]
/// Cancelles the process
macro_rules! cancelled {
    () => {
        crash!(
            $crate::internal::exit_code::AppExitCode::UserCancellation,
            "Installation cancelled"
        )
    };
}

/// Logs a message and exits the program with the given exit code.
pub fn log_and_crash(msg: String, exit_code: AppExitCode) -> ! {
    get_logger().reset_output_type();
    get_logger().log_error(msg);
    get_logger().flush();
    exit(exit_code as i32);
}

pub fn get_config_dir() -> &'static Path {
    lazy_static! {
        static ref CONFIG_DIR: &'static Path = create_if_not_exist(get_directories().config_dir());
    }

    &CONFIG_DIR
}

pub fn get_cache_dir() -> &'static Path {
    lazy_static! {
        static ref CACHE_DIR: &'static Path = create_if_not_exist(get_directories().cache_dir());
    }

    &CACHE_DIR
}

fn get_directories() -> &'static ProjectDirs {
    lazy_static! {
        static ref DIRECTORIES: ProjectDirs = ProjectDirs::from("com", "axos-project", "epsi").unwrap();
    }

    &DIRECTORIES
}

fn create_if_not_exist(dir: &Path) -> &Path {
    if !dir.exists() {
        fs::create_dir_all(dir)
            .map_err(AppError::from)
            .silent_unwrap(AppExitCode::FailedCreatingPaths)
    }

    dir
}

pub fn wrap_text<S: AsRef<str>>(s: S, padding: usize) -> Vec<String> {
    let subsequent_padding = " ".repeat(padding);
    let opts =
        textwrap::Options::new(crossterm::terminal::size().unwrap().0 as usize - (padding + 1))
            .subsequent_indent(&subsequent_padding);
    wrap(s.as_ref(), opts)
        .into_iter()
        .map(String::from)
        .collect()
}

pub fn is_run_with_root() -> bool {
    let uid = unsafe { libc::geteuid() };
    uid == 0
}

pub fn escalate_with_args(extra_args: &[&str], preserve_env: bool) {
    if is_run_with_root() {
        return;
    }

    let exe = std::env::current_exe().expect("Failed to get current exe path");
    let mut args: Vec<String> = std::env::args().collect();
    args[0] = exe.to_string_lossy().to_string();

    for arg in extra_args {
        args.push(arg.to_string());
    }

    let mut cmd = std::process::Command::new("sudo");

    if preserve_env {
        cmd.arg("-E");
    }

    let status = cmd
        .args(&args)
        .status()
        .expect("Failed to execute sudo");

    std::process::exit(status.code().unwrap_or(1));
}