David's Dot Files
=================

These are config files to set up a system the way I like it. These files are
based largely on Ryan Bates's dotfiles repo. I am storing my emacs
configuration separately (for now); just search for davemacs if you want to
look at them.

Installation
-----------

### Requirements

Before installing the dotfiles, you must have the following installed:

* git
* zsh (optional but recommended)
* ruby
* rake
* tmux (optional but recommended)

For Fedora/RHEL/CentOS, here's the commands to run:

```
sudo yum install -y zsh ruby ruby-devel ruby-libs rubygems rubygem-rake git tmux
chsh -s /bin/zsh
```

On Ubuntu:

```
sudo apt-get install -y ruby zsh git tmux
sudo gem install rake
chsh -s /usr/bin/zsh
```

### Install

The first option is to use the install script:

    curl -L https://raw.github.com/daviddavis/dotfiles/master/install.sh | sh


Otherwise you can manually install the dotfiles:

    curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh
    git clone --recursive https://github.com/daviddavis/dotfiles.git ~/.dotfiles
    cd ~/.dotfiles
    rake
    vim -c "NeoBundleInstall"


Environment
-----------

I use both Linux and Mac OS X so this ought to support both. I primarily use
zsh, but this includes some older bash files as well.  If you would like to
switch to zsh, you can do so with the following command.

    chsh -s /bin/zsh
