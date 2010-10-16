alias ll="ls -l"

function mkcd {
  nocorrect mkdir -p "$1" && cd "$1"
}