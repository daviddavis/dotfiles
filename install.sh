#!/bin/bash

#      Dotfiles install script
# To install, just run the following command. You must have ruby, rake, git,
# and zsh installed.
#
# curl -L https://raw.github.com/daviddavis/dotfiles/master/install.sh | sh
#

# install oh-my-zsh
if [ -e "/bin/zsh" ]
then
  git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
fi

# get the dotfiles
git clone --recursive https://github.com/daviddavis/dotfiles.git ~/.dotfiles

# install vim plugins
cd ~/.dotfiles
rake
vim -c ":PlugInstall"
