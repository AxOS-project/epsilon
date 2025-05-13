use crate::builder::pacman::PacmanDatabasesSyncBuilder;
use crate::{fl_info};

#[tracing::instrument(level = "trace")]
pub async fn sync() {
    tracing::debug!("Syncing databases");

    fl_info!("syncing-databases");

    let result = PacmanDatabasesSyncBuilder::default()
        .sync()
        .await;

    if result.is_err() {
        // TODO: Handle error
    }
}
