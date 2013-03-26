alias ll="ls -alh"
alias -g ....='../../..'
alias -g .....='../../../..'
alias clr="lein repl" # clojure lein repl

alias tag="ctags --tag-relative -R --exclude=.git --exclude=log --languages=-javascript,sql"

alias g="nocorrect git"
alias gg="g st -s"
alias gs="git stash"
alias gpd="gist -p --type=diff"
alias rp="rake && ggpush"
alias rdbm="rake db:migrate && rake db:test:load"
alias testdb="RAILS_ENV=test rake db:drop; RAILS_ENV=test rake db:create && RAILS_ENV=test rake db:test:load"
alias gd="git diff"
alias gcb="git checkout -b"
alias gsu="grt; git submodule update --init; cd -"

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
alias m="mux"

alias wee="weechat-curses"
alias ov="sudo openvpn /etc/openvpn/*.conf"
alias y="yum"