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
alias katello-res="katello-reset-db && rs"
alias k="bundle exec hammer"

# backwards compatible
alias kpr="pull"
alias kcp="pull-commit"

# hammer
alias h="bundle exec hammer"

# pulp
alias pulp-reset-db="mongo pulp_database --eval 'db.dropDatabase()' && sudo pulp-manage-db && sudo service httpd restart"