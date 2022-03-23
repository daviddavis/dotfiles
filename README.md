David's Dot Files
=================

These are config files to set up a system the way I like it. I am storing my emacs configuration
separately (for now); just search for davemacs if you want to look at them.

Installation
-----------

### Requirements

Before installing the dotfiles, you must have the following installed:

* git
* zsh (optional but recommended)
* tmux (optional but recommended)

For Fedora/RHEL/CentOS, here's the commands to run:

```
sudo dnf install -y zsh git tmux vim fzf fd-find ripgrep direnv
chsh -s /bin/zsh
```

On Debian/Ubuntu:

```
sudo apt install -y zsh git tmux fzf curl fd-find ripgrep direnv
ln -s $(which fdfind) ~/.local/bin/fd
chsh -s /usr/bin/zsh
```

### Install

The first option is to use the install script:

    curl -L https://raw.github.com/daviddavis/dotfiles/main/install.sh | sh


Otherwise you can manually install the dotfiles:

    git clone git@github.com:ohmyzsh/ohmyzsh.git ~/.oh-my-zsh
    git clone --recursive https://github.com/daviddavis/dotfiles.git ~/.dotfiles
    cd ~/.dotfiles
    ./setup.sh
    vim -c ":PlugInstall"
