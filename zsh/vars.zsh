# stuff to edit the path
export PATH="/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin:/usr/local/Cellar/python/2.7.1/bin:$PATH"
[[ -s "$HOME/.cabal" ]] && export PATH="$HOME/.cabal/bin:$PATH"
[[ -s "/usr/local/Cellar/python/2.7/bin" ]] && export PATH="/usr/local/Cellar/python/2.7/bin:$PATH"

# xdg bin
[[ -s "$HOME/.local/bin" ]] && export PATH="$HOME/.local/bin:$PATH"

# personal bin
[[ -s "$HOME/.bin" ]] && export PATH="$HOME/.bin:$PATH"

# rvm
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"  # This loads RVM into a shell session.

# classpath for clojure-contrib
[[ -s "/usr/local/Cellar/clojure-contrib" ]] && export CLASSPATH="$CLASSPATH:/usr/local/Cellar/clojure-contrib/1.2.0/clojure-contrib.jar"

# ignore _ in python
export PYFLAKES_BUILTINS="_"
