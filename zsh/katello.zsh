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
  git push origin `current_branch`

  if [[ -n $1 ]]
  then
    hub pull-request -b katello:$1
  else
    hub pull-request -b katello:`current_branch`
  fi
}

function kr() {
  if [[ -n $1 ]]
  then
    br=$1
  else
    br=`current_branch`
  fi

  git fetch upstream
  git reset upstream/$br
}

function krh() {
  if [[ -n $1 ]]
  then
    br=$1
  else
    br=`current_branch`
  fi

  print "Fetching upstream..."
  git fetch upstream
  git log upstream/$br.. --max-count=5
  echo "The above commit(s) will be lost. Press Y to continue: \c"
  read line
  if [ "$line" = Y ] || [ "$line" = y ]; then
    git reset --hard upstream/$br
  else
    echo "Aborted!"
    return 1
  fi
}