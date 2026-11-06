# xdg bin
[[ -s "$HOME/.local/bin" ]] && export PATH="$HOME/.local/bin:$PATH"

# personal bin
[[ -s "$HOME/.bin" ]] && export PATH="$HOME/.bin:$PATH"

# mise
export MISE_DEFAULT_CONFIG_FILENAME='mise.local.toml'
