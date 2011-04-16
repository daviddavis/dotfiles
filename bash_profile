# aliases
alias s="script/server -u"
alias sp="script/server RAILS_ENV=production"
alias sc="script/console"
alias ll="ls -al"
alias sl="tail -f -n 30 log/development.log"
alias pg_start="sudo su postgres -c \"pg_ctl start -D /opt/local/var/db/postgresql84/data\""
alias g="git"
alias gs="git svn"
alias rf="rm -rf"
# alias rs="cd /Users/davidd/Sites/robertson_scholars"
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

# export ARCHFLAGS
export ARCHFLAGS="-arch i386 -arch x86_64"

# command prompt
export PROMPT_COMMAND='PS1="\`if [[ \$? = "0" ]]; then echo "\\[\\033[32m\\]"; else echo "\\[\\033[31m\\]"; fi\`\u.\h:\`if [[ `pwd|wc -c|tr -d " "` > 18 ]]; then echo "\\W"; else echo "\\w"; fi\` →\[\033[0m\] "; echo -ne "\033]0;`hostname -s`:`pwd`\007"'

# let's tell our shell to use rvm for davidd
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
