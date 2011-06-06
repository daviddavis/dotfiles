# rails 3 shortcut 'r'
alias r='rails'

# launching console/server
sc () {
  if [ -f ./script/rails ]; then 
    rails c $@
  else
    ./script/console $@
  fi
}

sg () {
  if [ -f ./script/rails ]; then
    rails g $@
  else
    ./script/generate $@
  fi
}

ss () {
  if [ -f ./script/rails ]; then 
    rails s -u $@
  else
    ./script/server -u $@
  fi
}