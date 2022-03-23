alias ll="ls -alh"
alias -g ....='../../..'
alias -g .....='../../../..'
alias clr="lein repl" # clojure lein repl
alias t=tmux
alias y="yum"
alias gist="gh gist create"
alias weather="curl wttr.in"

alias g="nocorrect git"
alias gg="g st -s"
alias gs="git stash"
alias gaa="git rev-parse --show-toplevel | xargs git add -A"

alias rp="rake && ggpush"
alias rdbm="rake db:migrate"
alias testdb="RAILS_ENV=test rake db:drop && RAILS_ENV=test rake db:create && RAILS_ENV=test rake db:migrate"

# ruby aliases
alias heroku="nocorrect heroku"
alias b="bundle"
alias u="unicorn_rails"
alias prc="pry -r config/environment.rb"
alias rr="cd .. && cd - && rvm-prompt" # reload rvm
alias irb="pry"
alias rs="rails server -b 0.0.0.0" # bind to all interfaces
