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

mkdir -p ~/.config

# Remove links to files that moved under ~/.config
for old in ~/.gitconfig ~/.gitignore ~/.tmux.conf ~/.vimrc ~/.vim/plug; do
  if [ -h "$old" ] && [[ "$(readlink "$old")" == "${dotfilesDir}"/* ]]; then
    echo "Removing old link: ${old}"
    rm "$old"
  fi
done

linkDotfile bash_profile
linkDotfile bin
linkDotfile netrc
linkDotfile zshrc
linkDotfile zshrc.d
linkDotfile rgignore

for item in config/*; do
  linkDotfile "$item"
done

if [ ! -f ~/.config/vim/autoload/plug.vim ]; then
  curl -fLo ~/.config/vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

# Ensure netrc has secure permissions (mise and other tools require 0600)
chmod 600 ~/.netrc
