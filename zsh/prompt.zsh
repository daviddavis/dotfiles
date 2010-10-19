# command line prompt
autoload colors zsh/terminfo
colors
autoload -U promptinit
promptinit
PS1="%{$fg[green]%}%n@%m %B%c%b %{$fg[green]%}%# %{$reset_color%}%"
