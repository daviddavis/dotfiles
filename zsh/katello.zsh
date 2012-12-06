export KATELLO_PATH="/home/dadavis/Projects/katello"
alias krdb="$KATELLO_PATH/src/script/katello-reset-dbs development . -f"
alias kping="katello ping"
alias k="~/.bin/katello"

function kpr() {
  if [[ -n $2 ]]
  then
    git checkout -b $2
  fi

  # push current branch
  ggpush

  if [[ -n $1 ]]
  then
    hub pull-request -b katello:$1
  else
    hub pull-request -b katello:`current_branch`
  fi
}

function kr() {
  git fetch upstream
  git reset upstream/`current_branch`
}

function krh() {
  echo "This is bad. Press Y/y to continue: \c"
  read line
  if [ "$line" = Y ] || [ "$line" = y ]; then
    git fetch upstream
    git reset --hard upstream/`current_branch`
  else
    return 1
  fi
}