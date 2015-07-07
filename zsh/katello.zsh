[[ -n $KATELLO_PATH ]] || export KATELLO_PATH="$HOME/Projects/katello"

# directories
export sat=~s/satellite
export ks="$KATELLO_PATH"
export kc="${KATELLO_PATH}/../hammer-cli-katello"
export KATELLO_CLI_PATH=$kc
export foreman=~s/foreman
export fd=~s/foreman-docker

export hc=~s/hammer-cli
export hck=~s/hammer-cli-katello
export hcf=~s/hammer-cli-foreman
export hcfd=~s/hammer_cli_foreman_docker

# aliases
alias koji-katello="koji -c ~/.koji/katello.conf"
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

alias docker-debug="sudo /usr/bin/docker -d -H tcp://0.0.0.0:2375 -H unix:///var/run/docker.sock --debug=true"

# add in scripts directory
[[ -s ${KATELLO_PATH}-scripts ]] && export PATH=$PATH:${KATELLO_PATH}-scripts/bin

# redmine/bz importer functions
function clone-to-redmine {
  curl http://tesla.usersys.redhat.com:3030/bz-to-redmine/$1
  echo ""
}
function clone-to-bz {
  curl http://tesla.usersys.redhat.com:3030/redmine-to-bz/$1
  echo ""
}
