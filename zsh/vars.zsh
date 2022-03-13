# stuff to edit the path
export PATH="/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin:/usr/local/Cellar/python/2.7.1/bin:$PATH"

# xdg bin
[[ -s "$HOME/.local/bin" ]] && export PATH="$HOME/.local/bin:$PATH"

# personal bin
[[ -s "$HOME/.bin" ]] && export PATH="$HOME/.bin:$PATH"

# rvm
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"  # This loads RVM into a shell session.

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
if [[ -s $PYENV_ROOT ]]; then
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init --path)"
fi

# ignore _ in python
export PYFLAKES_BUILTINS="_"
