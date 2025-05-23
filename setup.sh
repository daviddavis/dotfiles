#!/bin/bash
dotfilesDir=$(pwd)

function linkDotfile {
  dest="${HOME}/.${1}"
  dateStr=$(date +%Y-%m-%d-%H%M)

  if [ -h ~/.${1} ]; then
    # Existing symlink
    rm ${dest}

  elif [ -f "${dest}" ]; then
    # Existing file
    echo "Backing up existing file: ${dest}"
    mv ${dest}{,.${dateStr}}

  elif [ -d "${dest}" ]; then
    # Existing dir
    echo "Backing up existing dir: ${dest}"
    mv ${dest}{,.${dateStr}}
  fi

  echo "Linking ${dest}"
  ln -s ${dotfilesDir}/${1} ${dest}
}

mkdir -p ~/.vim
mkdir -p ~/.config

linkDotfile bash_profile
linkDotfile bin
linkDotfile config/nvim
linkDotfile config/pypoetry
linkDotfile ctags
linkDotfile direnvrc
linkDotfile git_hooks
linkDotfile gitconfig
linkDotfile gitignore
linkDotfile netrc
linkDotfile tmux.conf
linkDotfile vim/autoload
linkDotfile vim/plug
linkDotfile vim/snippets
linkDotfile vimrc
linkDotfile zshrc
linkDotfile zshrc.d
linkDotfile rgignore
