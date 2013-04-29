[[ -n $KATELLO_PATH ]] || export KATELLO_PATH="/home/dadavis/Projects"

# directories
export se=~s/system-engine
export ks="$KATELLO_PATH/katello"
export kc="$KATELLO_PATH/katello-cli"

# aliases
alias krdb="$ks/script/delayed_job stop && $ks/script/katello-reset-dbs -f development ."
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

function kcp() {
  if [[ -n $2 ]]
  then
    temp_branch=$2
  else
    temp_branch=temp_`date +%s`
  fi
  message=$1
  branch=`current_branch`

  git checkout -b $temp_branch
  git add `git rev-parse --show-toplevel`
  git commit -am "$message"
  git push origin $temp_branch
  hub pull-request "$message" -b katello:$branch
}