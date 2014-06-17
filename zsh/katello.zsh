[[ -n $KATELLO_PATH ]] || export KATELLO_PATH="/home/dadavis/Projects/katello"

# directories
export sat=~s/satellite
export ks="$KATELLO_PATH"
export kc="${KATELLO_PATH}/../hammer-cli-katello"
export KATELLO_CLI_PATH=$kc
export foreman="$KATELLO_PATH/../foreman"

export hc=~s/hammer-cli
export hck=~s/hammer-cli-katello
export hcf=~s/hammer-cli-foreman

# aliases
alias katello-reset="rake katello:reset"
alias katello-ping="hammer ping"
alias katello-res="katello-reset && rs"
alias k="bundle exec hammer"

# js
alias jstest="cd ~ks/engines/bastion/ && grunt ci && cd -"

# backwards compatible
alias kpr="pull"
alias kcp="pull-commit"

# hammer
alias h="bundle exec hammer"

# add in scripts directory
[[ -s ${KATELLO_PATH}-scripts ]] && export PATH=$PATH:${KATELLO_PATH}-scripts/bin

# github clone
function kclone() {
  git clone git@github.com:daviddavis/$1.git
  cd $1
  git remote add upstream git://github.com/Katello/$1.git
  git fetch --all
}

# redmine/bz importer functions
function clone-to-redmine {
  curl http://tesla.usersys.redhat.com:3030/bz-to-redmine/$1
}
function clone-to-bz {
  curl http://tesla.usersys.redhat.com:3030/redmine-to-bz/$1
}
