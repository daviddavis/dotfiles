[[ -n $KATELLO_PATH ]] || export KATELLO_PATH="/home/dadavis/Projects/katello"

# directories
export sat=~s/satellite
export ks="$KATELLO_PATH"
export kc="${KATELLO_PATH}-cli"
export KATELLO_CLI_PATH=/home/dadavis/.bin/katello

export hc=~s/hammer-cli
export hck=~s/hammer-cli-katello
export hcf=~s/hammer-cli-foreman

# aliases
alias koji-katello="koji -c ~/.koji/katello.conf"
alias katello-reset="rake katello:reset"
alias katello-ping="hammer ping"
alias katello-res="katello-reset && rs"
alias k="bundle exec hammer"

# backwards compatible
alias kpr="pull"
alias kcp="pull-commit"

# hammer
alias h="bundle exec hammer"

# pulp
alias pulp-reset-db="mongo pulp_database --eval 'db.dropDatabase()' && pulp-manage-db && sudo service httpd restart"

# js
alias jstest="cd ~ks/engines/bastion/ && grunt ci && cd -"

# github clone
function kclone() {
  git clone git@github.com:daviddavis/$1.git
  cd $1
  git remote add upstream git://github.com/Katello/$1.git
  git fetch --all
}