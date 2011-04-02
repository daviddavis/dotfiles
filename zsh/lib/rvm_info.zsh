# get the name of the branch we are
function rvm_prompt_info() {
  ruby_version=$(~/.rvm/bin/rvm-prompt 2> /dev/null) || return

  if [[ -n $ruby_version ]] && echo "%F{2}-%F{7}$ruby_version[6,10]$ruby_version[16,-1]%F{2}-%f"
}

RPROMPT+='$(rvm_prompt_info)'