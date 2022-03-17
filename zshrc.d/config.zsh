# general config options 
export EDITOR='vim'
#setopt CORRECT

# load our functions
fpath=(~/.zshrc.d/functions $fpath)
autoload -U ~/.zshrc.d/functions/*(:t)

# history
#HISTFILE=~/.zsh_history
#HISTSIZE=1000
#SAVEHIST=1000
#REPORTTIME=10 # print elapsed time when more than 10 seconds

zle -N tab

# export node path
export NODE_PATH="$NODE_PATH:/usr/local/lib/node_modules:/usr/local/lib/node"

# bind some keys
#bindkey '^[^[[D' backward-word
#bindkey '^[^[[C' forward-word
#bindkey '^[[5D' beginning-of-line
#bindkey '^[[5C' end-of-line
#bindkey '^[[3~' delete-char
bindkey  '^[^N' tab
#bindkey '^?' backward-delete-char

# virutalenvwrapper setup
export WORKON_HOME=$HOME/.virtualenvs
[[ -a /usr/bin/virtualenvwrapper.sh ]] && source /usr/bin/virtualenvwrapper.sh
[[ -a /usr/local/bin/virtualenvwrapper.sh ]] && source /usr/local/bin/virtualenvwrapper.sh
