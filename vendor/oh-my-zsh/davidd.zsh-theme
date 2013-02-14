if [[ $TERM = *256color* || $TERM = *rxvt* ]]; then
  orange="%F{166}"
  blue="%F{33}"
  magenta="%F{125}"
  green="%F{64}"
  gray="%F{244}"
  red="%F{160}"
else
  orange="$fg[yello]"
  blue="$fg[blue]"
  magenta="$fg[blue]"
  green="$fg[green]"
  gray="$fg[white]"
  red="$fg[red]"
fi


PROMPT='%{$orange%}%m %{$magenta%}%c $(git_prompt_info)%{$reset_color%}%{$orange%}→%{$reset_color%} '

ZSH_THEME_GIT_PROMPT_PREFIX="%{$gray%}[%{$green%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$gray%}] "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$red%}*%{$reset_color%}"
