for f in ~/.zsh/*.zsh; do source $f; done

# use .localrc for settings specific to one system
[[ -f ~/.localrc ]] && .  ~/.localrc