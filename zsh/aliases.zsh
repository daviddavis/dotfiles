alias ll="ls -alh"
alias -g ....='../../..'
alias -g .....='../../../..'
alias clr="lein repl" # clojure lein repl
alias t=tmux

alias tag="ctags --tag-relative -Rf.git/tags --exclude=.git --exclude=log --languages=-javascript,sql"

alias g="nocorrect git"
alias gg="g st -s"
alias gs="git stash"
alias gpd="gist -p --type=diff"
alias gaa="git rev-parse --show-toplevel | xargs git add -A"
alias gtd="cd \`git rev-parse --show-toplevel\`"
alias rp="rake && ggpush"
alias rdbm="rake db:migrate"
alias testdb="RAILS_ENV=test rake db:drop && RAILS_ENV=test rake db:create && RAILS_ENV=test rake db:migrate"
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
alias rr="cd .. && cd - && rvm-prompt" # reload rvm

alias m="mux"
alias y="yum"
alias gist="gist -p" # automatically make gists private