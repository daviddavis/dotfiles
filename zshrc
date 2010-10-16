# init
autoload -U compinit; compinit

# colorful listings
zmodload -i zsh/complist
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

for f in ~/.zsh/*.zsh; do source $f; done

# use .localrc for settings specific to one system
[[ -f ~/.localrc ]] && .  ~/.localrc