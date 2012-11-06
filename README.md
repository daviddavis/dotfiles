David's Dot Files
=================

These are config files to set up a system the way I like it. These 
files are based largely on Ryan Bates's dotfiles repo. I am storing
my emacs configuration separately (for now); just search for 
davemacs if you want to look at them.

Installation
-----------

The first option is to use the install script:

  curl -L https://raw.github.com/daviddavis/dotfiles/master/install.sh | sh


Otherwise you can manually install the dotfiles:

  curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh
  git clone --recursive git@github.com:daviddavis/dotfiles.git ~/.dotfiles
  cd ~/.dotfiles
  rake
  vim -c "BundleInstall"


Environment
-----------

I am running on Mac OS X, but it will likely work on Linux as well with 
minor fiddling. I primarily use zsh, but this includes some older bash 
files as well. If you would like to switch to zsh, you can do so with 
the following command.

  chsh -s /bin/zsh