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

See the [mise installation docs](https://mise.jdx.dev/installing-mise.html) for other
ways to install mise.

### Fedora/RHEL/CentOS

```sh
sudo dnf install -y fzf zsh git tmux vim gcc make unzip
chsh -s /bin/zsh
```

Install mise from the COPR repo:

```sh
sudo dnf copr enable -y jdxcode/mise
sudo dnf install -y mise
```

### Debian/Ubuntu

```sh
sudo apt update
sudo apt install -y fzf zsh git tmux vim curl build-essential unzip
chsh -s /usr/bin/zsh
```

Install mise from the PPA:

```sh
sudo add-apt-repository -y ppa:jdxcode/mise
sudo apt update
sudo apt install -y mise
```

### macOS

Install [Homebrew](https://brew.sh/), then from the repo root:

```sh
brew bundle --file=Brewfile
chsh -s /usr/bin/zsh
```

The Brewfile includes mise, so no extra step is needed.

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

### After bootstrap (all platforms)

Once dotfiles are linked, mise will pick up `~/.config/mise/config.toml` 
and install the rest of the tools:

```sh
mise install
```

### Update authorized SSH keys

To append the public SSH keys from GitHub:

```sh
mkdir -p ~/.ssh
gh api --paginate /user/keys --jq '.[] | "\(.key) \(.title)"' >> ~/.ssh/authorized_keys
chmod 700 ~/.ssh
chmod 600 ~/.ssh/authorized_keys
```
