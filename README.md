David's Dot Files
=================

These are config files to set up a system the way I like it. I am storing my emacs configuration
separately (for now); just search for davemacs if you want to look at them.

Installation
-----------

## Requirements

Most dev tools (node, python, neovim, ripgrep, fd, etc.) are managed by
[mise](https://mise.jdx.dev/) via [config/mise/config.toml](config/mise/config.toml),
so each OS only needs a small bootstrap: a shell, git, tmux, vim, and mise itself.

See the [mise installation docs](https://mise.jdx.dev/installing-mise.html) for the
recommended way to install mise on your platform.

### Fedora/RHEL/CentOS

```sh
sudo dnf install -y zsh git tmux vim
chsh -s /bin/zsh
```

### Debian/Ubuntu

```sh
sudo apt update
sudo apt install -y zsh git tmux vim curl
chsh -s /usr/bin/zsh
```

### macOS

Install [Homebrew](https://brew.sh/), then from the repo root:

```sh
brew bundle --file=Brewfile
chsh -s /usr/bin/zsh
```

### After bootstrap (all platforms)

Once dotfiles are linked (see Install below), mise will pick up
`~/.config/mise/config.toml` and install the rest of the tools:

```sh
mise install
```

## Install

The first option is to use the install script:

```sh
curl -L https://raw.github.com/daviddavis/dotfiles/main/install.sh | sh
```

Otherwise you can manually install the dotfiles:

```sh
git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh
git clone --recursive https://github.com/daviddavis/dotfiles.git ~/.dotfiles
~/.dotfiles/bin/update-dotfiles
```