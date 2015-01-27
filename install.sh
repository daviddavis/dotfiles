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
  curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh
fi

# get the dotfiles
git clone --recursive https://github.com/daviddavis/dotfiles.git ~/.dotfiles

# install vim plugins
cd ~/.dotfiles
rake
vim +BundleInstall +qall