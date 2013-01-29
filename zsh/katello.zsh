export KATELLO_PATH="/home/dadavis/Projects/katello"
alias krdb="$KATELLO_PATH/src/script/delayed_job stop && $KATELLO_PATH/src/script/katello-reset-dbs -f development ."
alias kping="katello ping"
alias k="~/.bin/katello"
alias kpl="pylint --rcfile=/etc/spacewalk-pylint.rc --additional-builtins=_ katello"

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