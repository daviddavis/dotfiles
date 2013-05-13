[[ -n $KATELLO_PATH ]] || export KATELLO_PATH="/home/dadavis/Projects/katello"

# directories
export sat=~s/satellite
export ks="$KATELLO_PATH"
export kc="${KATELLO_PATH}-cli"

# aliases
alias krdb="$ks/script/delayed_job stop && $ks/script/katello-reset-dbs -f development ."
alias kping="katello ping"
alias k="~/.bin/katello"
alias kpl="pylint --rcfile=/etc/spacewalk-pylint.rc --additional-builtins=_ katello"
alias dj="$KATELLO_PATH/script/delayed_job"
alias kres="krdb && dj start && rsd"

function kpr() {
  if [[ -n $2 ]]
  then
    dst_branch=$2
  else
    dst_branch="master"
  fi

  # push current branch
  git push origin `current_branch`

  if [[ -n $1 ]]
  then
    hub pull-request $1 -b katello:$dst_branch
  else
    hub pull-request -b katello:$dst_branch
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

function kip() {
  temp_branch=temp_`date +%s`

  git checkout -b $temp_branch
  git add `git rev-parse --show-toplevel`
  git commit -am "$1"
  git push origin $temp_branch
  hub pull-request -i $2 -b katello:$branch
}