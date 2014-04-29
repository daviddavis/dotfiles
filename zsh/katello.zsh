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

# pulp
function pulp-restart() {
  for x in pulp_workers pulp_celerybeat pulp_resource_manager httpd
  do
    sudo service $x restart
  done
}

function pulp-reset-db() {
  mongo pulp_database --eval 'db.dropDatabase()'
  sudo -u apache pulp-manage-db
  pulp-restart
}

# github clone
function kclone() {
  git clone git@github.com:daviddavis/$1.git
  cd $1
  git remote add upstream git://github.com/Katello/$1.git
  git fetch --all
}