alias ll="ls -alh"
alias ss="rsd"
#alias s="script/server -u"
#alias sc="script/console -u"
alias sc="rc"
alias -g ....='../../..'
alias -g .....='../../../..'
alias m="mux"
alias u="unicorn_rails"
alias s="screen"
alias clr="lein repl" # clojure lein repl
alias b="bundle"
alias heroku="nocorrect bundled_heroku"

alias tag="ctags -R --exclude=.git --exclude=log --exclude='*.js'"

alias g="nocorrect git"
alias gg="g st"
alias gs="git svn"
alias gf="git flow"
alias gpd="gist -p --type=diff"
alias rp="rake && ggpush"

alias cuke="bundle exec cucumber --require features"
alias wip="bundle exec rake cucumber:wip"

#alias gpull='git pull origin `get_git_branch`'
#alias gpush='git push origin `get_git_branch`'

alias fact="elinks -dump randomfunfacts.com | sed -n '/^| /p' | tr -d \|"

alias rvm="nocorrect rvm"
alias heroku="nocorrect heroku"

# fix colors in tmux on gnome terminal
alias tmux="TERM=xterm-256color tmux"
alias mux="TERM=xterm-256color mux"

alias wee="weechat-curses"