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

alias kpr="pull"
alias kcp="pull-commit"