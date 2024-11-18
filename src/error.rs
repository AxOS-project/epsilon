use std::fmt::Debug;

use crate::internal::exit_code::AppExitCode;
use crate::{fl, fl_crash};
use thiserror::Error;

pub type AppResult<T> = Result<T, AppError>;

#[derive(Debug, Error)]
#[allow(clippy::module_name_repetitions)]
pub enum AppError {
    #[error("IoError: {0}")]
    Io(#[from] std::io::Error),

    #[error("AUR RPC call failed {0}")]
    Rpc(#[from] aur_rpc::error::RPCError),

    #[error("{}", fl!("build-step-violation"))]
    BuildStepViolation,

    #[error("{} {pkg_name}", fl!("build-error"))]
    BuildError { pkg_name: String },

    #[error("{}", fl!("user-cancel"))]
    UserCancellation,

    #[error("{} {}",fl!("missing-deps"), _0.join(", ") )]
    MissingDependencies(Vec<String>),

    #[error("{} {0}", fl!("makepkg-err"))]
    MakePkg(String),

    #[error(transparent)]
    MinusError(#[from] minus::MinusError),

    #[error(transparent)]
    FmtError(#[from] std::fmt::Error),

    #[error(transparent)]
    AlpmError(#[from] crate::internal::alpm::Error),

    #[error("{}", fl!("non-zero-exit"))]
    NonZeroExit,

    #[error("{0}")]
    Other(String),
}

impl From<String> for AppError {
    fn from(string: String) -> Self {
        Self::Other(string)
    }
}

impl From<&str> for AppError {
    fn from(string: &str) -> Self {
        Self::from(string.to_string())
    }
}

pub trait SilentUnwrap<T> {
    fn silent_unwrap(self, error_code: AppExitCode) -> T;
}

impl<T> SilentUnwrap<T> for AppResult<T> {
    fn silent_unwrap(self, exit_code: AppExitCode) -> T {
        match self {
            Ok(val) => val,
            Err(e) => {
                tracing::debug!("{e}");
                fl_crash!(exit_code, "error-occurred")
            }
        }
    }
}
