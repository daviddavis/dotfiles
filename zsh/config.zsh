# general config options 
export EDITOR='vim'
setopt CORRECT

# load our functions
fpath=(~/.zsh/functions $fpath)
autoload -U ~/.zsh/functions/*(:t)

# history
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000
REPORTTIME=10 # print elapsed time when more than 10 seconds

# command line prompt
autoload colors zsh/terminfo
colors
autoload -U promptinit
promptinit
PS1="%{$fg[green]%}%n@%m %B%c%b %{$fg[green]%}%# %{$reset_color%}%"

# bind some keys
bindkey '^[^[[D' backward-word
bindkey '^[^[[C' forward-word
bindkey '^[[5D' beginning-of-line
bindkey '^[[5C' end-of-line
bindkey '^[[3~' delete-char
bindkey '^?' backward-delete-char 

# path
export PATH="/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin:$PATH"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"  # This loads RVM into a shell session.