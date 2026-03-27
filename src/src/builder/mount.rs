use nix::mount::{mount, umount2, MntFlags, MsFlags};
use std::path::{Path, PathBuf};

pub struct ChrootMounts {
    mounts: Vec<PathBuf>,
}

impl Drop for ChrootMounts {
    fn drop(&mut self) {
        for mount_point in &self.mounts {
            let _ = umount2(mount_point, MntFlags::MNT_DETACH);
        }
    }
}

impl ChrootMounts {
    pub fn new() -> Self {
        Self { mounts: Vec::new() }
    }

    pub fn add_mount<P: AsRef<Path>>(
        &mut self,
        source: Option<&str>,
        target: P,
        fstype: Option<&str>,
        flags: MsFlags,
        data: Option<&str>,
    ) -> nix::Result<()> {
        let target_path = target.as_ref();

        mount(
            source,
            target_path,
            fstype,
            flags,
            data,
        )?;

        self.mounts.insert(0, target_path.to_path_buf());
        Ok(())
    }

    pub fn maybe_add_mount<P: AsRef<Path>>(
        &mut self,
        cond: bool,
        source: Option<&str>,
        target: P,
        fstype: Option<&str>,
        flags: MsFlags,
        data: Option<&str>,
    ) -> nix::Result<()> {
        if cond {
            self.add_mount(source, target, fstype, flags, data)?;
        }
        Ok(())
    }
}