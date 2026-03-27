use std::path::{Path, PathBuf};
use std::process::Command;

pub struct ChrootMounts {
    mounts: Vec<PathBuf>,
}

impl Drop for ChrootMounts {
    fn drop(&mut self) {
        for mount_point in &self.mounts {
            let _ = Command::new("umount")
                .arg("--lazy")
                .arg(mount_point)
                .status();
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
        args: &[&str],
    ) -> std::io::Result<()> {
        let mut cmd = Command::new("mount");

        if let Some(fstype) = fstype {
            cmd.arg("-t").arg(fstype);
        }

        if let Some(source) = source {
            cmd.arg(source);
        }

        cmd.arg(target.as_ref());

        for arg in args {
            cmd.arg(arg);
        }

        let status = cmd.status()?;
        if !status.success() {
            return Err(std::io::Error::new(
                std::io::ErrorKind::Other,
                format!("mount failed: {:?}", status),
            ));
        }

        self.mounts.insert(0, target.as_ref().to_path_buf());
        Ok(())
    }

    pub fn maybe_add_mount<P: AsRef<Path>>(
        &mut self,
        cond: bool,
        source: Option<&str>,
        target: P,
        fstype: Option<&str>,
        args: &[&str],
    ) -> std::io::Result<()> {
        if cond {
            self.add_mount(source, target, fstype, args)?;
        }
        Ok(())
    }
}