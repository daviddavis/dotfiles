[[ -n $KATELLO_PATH ]] || export KATELLO_PATH="/home/dadavis/Projects/katello"

# directories
export se=~s/system-engine
export ks="$KATELLO_PATH/src"
export kc="$KATELLO_PATH/cli"
export cli="$KATELLO/cli"

# aliases
alias krdb="$KATELLO_PATH/src/script/delayed_job stop && $KATELLO_PATH/src/script/katello-reset-dbs -f development ."
alias kping="katello ping"
alias k="~/.bin/katello"
alias kpl="pylint --rcfile=/etc/spacewalk-pylint.rc --additional-builtins=_ katello"
alias dj="$KATELLO_PATH/src/script/delayed_job"
alias kres="krdb && dj start && rsd"

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