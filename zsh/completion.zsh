# turn on completion 
autoload -U compinit
compinit

zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# matches case insensitive for lowercase
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# pasting with tabs doesn't perform completion
zstyle ':completion:*' insert-tab pending