# load ~/.bashrc if present (on Fedora it pulls in /etc/bashrc and adds ~/.local/bin to PATH)
[ -f ~/.bashrc ] && . ~/.bashrc

# aliases
alias ll="ls -al"
alias g="git"

# command prompt
export PROMPT_COMMAND='PS1="\`if [[ \$? = "0" ]]; then echo "\\[\\033[32m\\]"; else echo "\\[\\033[31m\\]"; fi\`\u@\h:\`if [[ `pwd|wc -c|tr -d " "` > 18 ]]; then echo "\\W"; else echo "\\w"; fi\` %\[\033[0m\] "; echo -ne "\033]0;`hostname -s`:`pwd`\007"'

# rebind Ctrl-p to go to the beginning of line since Ctrl-a is used for tmux/screen
bind '"\C-p": beginning-of-line'

# activate mise; keep this after PROMPT_COMMAND is set, since mise adds its hook to it
if command -v mise >/dev/null; then
  eval "$(mise activate bash)"
fi
