# Epsilon

Epsilon is a fast, efficient and lightweight AUR helper and Pacman wrapper.

Made for AxOS, based on Crystal amethyst.

## 💡 Features

- Fast and efficient!
- Asynchronous!
- Customizable!
- Parallel package building
- Install and search packages from the AUR and any added repositories
    
### Install or Build
Install with pkgbuild
```bash
 $ makepkg -si
```
or build from source
 ```bash
  $ cd src/
  $ cargo build --release
  $ cargo run
 ```
  
### Enable completions
The folowing example is for bash, but you can replace it with your shell.
```bash
# Add the output of the command below to the file (replace bash with your shell)
epsilon -G bash > ~/.epsilon_completion
# Add the following line to your shell configuration file
printf '\nsource ~/.epsilon_completion' >> ~/.bashrc
# Source it to enable completions in the current shell
source ~/.epsilon_completion
```
This will enable completions for epsilon in your shell.

## 📜 License

[GPLv3-only](https://choosealicense.com/licenses/gpl-3.0/)
