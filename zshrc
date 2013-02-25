# load os specific settings
if [[ `uname` == 'Darwin' ]]; then
  source ~/.osx.zsh
fi
if [[ `uname` == 'Linux' ]]; then
  source ~/.linux.zsh
fi

# load my custom oh-my-zsh files
export ZSH_CUSTOM="$HOME/.dotfiles/vendor/oh-my-zsh/"
#
# use .localrc for settings specific to one system
[[ -f ~/.localrc ]] && .  ~/.localrc

# import my customized stuff before oh-my-zsh
for f in ~/.zsh/*.zsh; do source $f; done

export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
export ZSH_THEME="davidd"

# Set to this to use case-sensitive completion
# export CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# export DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# export DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
export DISABLE_AUTO_TITLE="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git rails ruby rails3 osx brew lein node thor git-flow pow rvm gem cloudapp cap npm
  powder passenger bundler heroku python pip yum vundle)

# Path to your oh-my-zsh configuration.
source $ZSH/oh-my-zsh.sh

# Customize to your needs...
# export PATH=/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin:/opt/local/bin:/usr/local/git/bin

# source aliases again to override oh-my-zsh's
source ~/.zsh/aliases.zsh

unsetopt hist_verify
skip_global_compinit=1

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
PATH=$PATH:$HOME/Library/Haskell/bin # add haskell/cabal

# load tmuxninator
[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator

# rebind Ctrl-p to go to beginning of line since Ctrl-a is used for screen/bash
bindkey "\C-p" 'beginning-of-line'

PS1="$PS1"'$([ -n "$TMUX" ] && tmux setenv TMUXPWD_$(tmux display -p "#D" | tr -d %) "$PWD")'
