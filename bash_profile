# aliases
alias ll="ls -al"
alias g="git"
alias gs="git svn"

# mkdir, cd into it
mkcd () {
 mkdir -p "$*"
 cd "$*"
}

# add mysql bin to path
export PATH="/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin:$PATH"

# add postgres in there too
export PATH=/usr/local/Cellar/postgresql/8.4.4:$PATH

export SVN_EDITOR="mvim"

# command prompt
export PROMPT_COMMAND='PS1="\`if [[ \$? = "0" ]]; then echo "\\[\\033[32m\\]"; else echo "\\[\\033[31m\\]"; fi\`\u@\h:\`if [[ `pwd|wc -c|tr -d " "` > 18 ]]; then echo "\\W"; else echo "\\w"; fi\` %\[\033[0m\] "; echo -ne "\033]0;`hostname -s`:`pwd`\007"'


# let's tell our shell to use rvm for davidd
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# rebind Ctrl-p to go to the beginning of line since Ctrl-a is used for tmux/screen
bind '"\C-p": beginning-of-line'

[ -s "/home/dadavis/.nvm/nvm.sh" ] && . "/home/dadavis/.nvm/nvm.sh" # This loads nvm
