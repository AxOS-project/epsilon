use std::env;
use std::fmt::Write;

use crate::error::AppError;
use crate::error::AppResult;
use crate::fl;
use crate::with_suspended_output;

use minus::Pager;

pub fn page_string<S: ToString>(content: S) -> AppResult<()> {
    let mut pager = Pager::new();
    pager.set_prompt(
        env::args().collect::<Vec<String>>().join(" ")
            + &format!(
                " | Q: {} | /: {} | n: {} | p: {}",
                fl!("quit"),
                fl!("search-paging"),
                fl!("next-result"),
                fl!("previous-result")
            ),
    )?;
    writeln!(pager, "{}", content.to_string())?;
    with_suspended_output!({ minus::page_all(pager).map_err(AppError::from) })
}
