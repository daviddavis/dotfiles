# import my customized stuff first
for f in ~/.zsh/*.zsh; do source $f; done

# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
export ZSH_THEME="gentoo"

# Set to this to use case-sensitive completion
# export CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# export DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# export DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# export DISABLE_AUTO_TITLE="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git rails ruby github rails3 osx brew lein node thor git-flow pow rvm gem cloudapp cap npm
  powder passenger bundler heroku python pip django virtualenvwrapper)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
# export PATH=/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin:/opt/local/bin:/usr/local/git/bin

# source aliases again to override oh-my-zsh's
source ~/.zsh/aliases.zsh

# use .localrc for settings specific to one system
[[ -f ~/.localrc ]] && .  ~/.localrc

unsetopt hist_verify
skip_global_compinit=1

export CC=gcc-4.2

export twitter_key=gBhlF52r61vISTDvIhKAZw
export twitter_secret=F39qZfHn8hDERnumA2UdIhP7YNVkm3nppSHXSQh48
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
PATH=$PATH:$HOME/Library/Haskell/bin # add haskell/cabal
