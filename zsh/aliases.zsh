alias ll="ls -alh"
alias -g ....='../../..'
alias -g .....='../../../..'
alias clr="lein repl" # clojure lein repl

alias tag="ctags -R --exclude=.git --exclude=log --exclude='*.js'"

alias g="nocorrect git"
alias gg="g st -sb"
alias gs="git stash"
alias gpd="gist -p --type=diff"
alias rp="rake && ggpush"
alias rdbm="rake db:migrate && rake db:test:prepare"
alias gd="git diff"
alias gcb="git checkout -b"

alias cuke="bundle exec cucumber --require features"
alias wip="bundle exec rake cucumber:wip"

alias fact="elinks -dump randomfunfacts.com | sed -n '/^| /p' | tr -d \|"

# ruby aliases
alias rvm="nocorrect rvm"
alias heroku="nocorrect heroku"
alias b="bundle"
alias u="unicorn_rails"
alias prc="pry -r config/environment.rb"

# fix colors in tmux on gnome terminal
#alias tmux="TERM=xterm-256color tmux"
#alias tmuxinator="TERM=xterm-256color tmuxinator"
alias tmux="tmux -2"
alias mux="TERM=xterm-256color mux"
alias m="mux"

alias wee="weechat-curses"
alias ov="sudo openvpn /etc/openvpn/*.conf"
alias y="yum"