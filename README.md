David's Dot Files
=================

These are config files to set up a system the way I like it. I am storing my emacs configuration
separately (for now); just search for davemacs if you want to look at them.

Installation
-----------

## Requirements

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

On MacOS:

```
brew install vim fd fzf direnv ripgrep tmux
chsh -s /usr/bin/zsh
```

## Install

The first option is to use the install script:

    curl -L https://raw.github.com/daviddavis/dotfiles/main/install.sh | sh


Otherwise you can manually install the dotfiles:

    git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh
    git clone --recursive https://github.com/daviddavis/dotfiles.git ~/.dotfiles
    ~/.dotfiles/bin/update-dotfiles


## Neovim setup

First [install neovim](https://github.com/neovim/neovim#install-from-package).

Then run `nvim +PackerSync` to install neovim plugins.

### Language servers

#### python-lsp-server

Either globally or in a venv with pip:

```
pip install python-lsp-server python-lsp-black git+https://github.com/paradoxxxzero/pyls-isort
```

To use pipx:

```
pipx install python-lsp-server
pipx inject python-lsp-server python-lsp-black git+https://github.com/paradoxxxzero/pyls-isort
```

#### MacOS

```
brew install lua-language-server pyright
```

#### Linux

For lua, [visit the website](https://github.com/sumneko/lua-language-server#build).

For pyright, run `sudo snap install --classic pyright` on Ubuntu.

