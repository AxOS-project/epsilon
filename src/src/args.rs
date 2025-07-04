#![allow(clippy::module_name_repetitions)]

use crate::{fl, operations::SearchBy};
use clap::{ArgAction, Parser, Subcommand, ValueHint};

static VERSION: &str = concat!(
    env!("CARGO_PKG_VERSION"),
);

#[derive(Debug, Clone, Parser)]
#[command(bin_name = "epsi", name = "Epsilon", version = VERSION, about = fl!("description"), infer_subcommands = true)]
pub struct Args {
    #[command(subcommand)]
    pub subcommand: Option<Operation>,

    #[arg(long, short, action = ArgAction::Count, global = true, help = fl!("verbose"))]
    pub verbose: u8,

    #[arg(long = "noconfirm", global = true, help = fl!("no-confirm"))]
    pub no_confirm: bool,

    // Not gonna lie the only reason this option is here is because
    // I was trying to figure out if paccache had a --noconfirm option.
    // So basically, it doesn't, but hey, we might as well have it here
    // anyways as some pacman commands can have a --quiet flag passed
    // to them.

    // umm interesting backstory ig
    #[arg(long, short, global = true, help = fl!("quiet"))]
    pub quiet: bool,

    #[arg(long = "sudoloop", global = true, help = fl!("sudoloop"))]
    pub sudoloop: bool,

    #[arg(long, short, global = true, value_hint = ValueHint::DirPath, help = fl!("cachedir"))]
    pub cachedir: Option<String>,
}

#[derive(Debug, Clone, Subcommand)]
pub enum Operation {
    #[command(bin_name = "epsi", name = "install", aliases = & [ "-S" ], visible_aliases = & ["i"], short_flag = 'S', about = fl!("install"))]
    Install(InstallArgs),

    #[command(bin_name = "epsi", name = "remove", visible_aliases = & ["rm"], short_flag = 'R', about = fl!("remove"))]
    Remove(RemoveArgs),

    #[command(bin_name = "epsi", name = "search", about = fl!("search"))]
    Search(InstallArgs),

    #[command(bin_name = "epsi", name = "query", short_flag = 'Q', about = fl!("query"))]
    Query(QueryArgs),

    #[command(bin_name = "epsi", name = "upgrade", visible_aliases = & ["-Syu"], about = fl!("upgrade"))]
    Upgrade(UpgradeArgs),

    #[command(bin_name = "epsi", name = "gencomp", short_flag = 'G', about = fl!("gencomp"))]
    GenComp(GenCompArgs),

    #[command(bin_name = "epsi", name = "clean", short_flag = 'C', about = fl!("clean"))]
    Clean,

    #[command(bin_name = "epsi", name = "checkupdates", about = fl!("checkupdates"))]
    CheckUpdates,

    #[command(bin_name = "epsi", name = "diff", short_flag = 'd', about = fl!("diff"))]
    Diff,

    #[command(bin_name = "epsi", name = "sync", short_flag = 'y', about = fl!("sync"))]
    Sync,
}

impl Default for Operation {
    fn default() -> Self {
        Self::Upgrade(UpgradeArgs::default())
    }
}

#[derive(Default, Debug, Clone, Parser)]
pub struct InstallArgs {
    #[arg(required = true, help = fl!("install-packages"))]
    pub packages: Vec<String>,

    #[arg(long, short, help = fl!("install-aur"))]
    pub aur: bool,

    #[arg(long, short, help = fl!("install-repo"))]
    pub repo: bool,

    #[arg(hide = true, short = 's', help = fl!("install-search"))]
    pub search: bool,

    #[arg(long, short, help = fl!("install-by"))]
    pub by: Option<SearchBy>,
}

#[derive(Default, Debug, Clone, Parser)]
pub struct RemoveArgs {
    #[arg(required = true, help = fl!("remove-packages"))]
    pub packages: Vec<String>,
}

#[derive(Default, Debug, Clone, Parser)]
pub struct QueryArgs {
    #[arg(long, short, help = fl!("query-aur"))]
    pub aur: bool,

    #[arg(long, short, help = fl!("query-repo"))]
    pub repo: bool,

    #[arg(long, short, help = fl!("query-explicit"))]
    pub explicit: bool,

    #[arg(long, short, help = fl!("query-info"))]
    pub info: Option<String>,

    #[arg(long, short, help = fl!("query-owns"))]
    pub owns: Option<String>,

    #[arg()]
    pub pkgs: Vec<String>, // this will be equal to "pacman -Q <pkg1> <pkg2>"
}

#[derive(Default, Debug, Clone, Parser)]
pub struct UpgradeArgs {
    #[arg(long, short, help = fl!("upgrade-repo"))]
    pub repo: bool,

    #[arg(long, short, help = fl!("upgrade-aur"))]
    pub aur: bool,

    #[arg(long = "with-snapshot", short = 's', help = "Create a snapshot before upgrading")]
    pub with_snapshot: bool,

    #[arg(
        long = "replace-snapshot",
        short = 'x',
        help = "Deletes the previous snapshot and creates a new one",
        requires = "with_snapshot"
    )]
    pub replace_snapshot: bool,

    #[arg(
        long = "delete-snapshot-onfail",
        short = 'd',
        help = "Deletes snapshot if the update fails",
        requires = "with_snapshot"
    )]
    pub delete_snapshot_onfail: bool,
}

#[derive(Default, Debug, Clone, Parser)]
pub struct GenCompArgs {
    #[arg(required = true, help = fl!("gencomp-shell"))]
    pub shell: String,
}
