## Quick Setup ##
The quick setup will download and setup bash, vim and tmux. Useful for setting up a server quickly.

| System | Command                         |
| ------ | ------------------------------- |
| Arch   | `sudo pacman -S git stow`       |
| Ubuntu | `sudo apt-get install git stow` |
| Redhat | `sudo yum install git-core stow` |

 - Install git and stow using your package manager.
 - Clone this repo into users home directory `git clone https://github.com/bmease/Dotfiles ~/Dotfiles`
 - Run `./install`
 - Source bashrc `source ~/.bashrc`
