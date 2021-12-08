# load os specific settings
if [[ `uname` == 'Darwin' ]]; then
  source ~/.osx.zsh
fi
if [[ `uname` == 'Linux' ]]; then
  source ~/.linux.zsh
fi

# load my custom oh-my-zsh files
export ZSH_CUSTOM="$HOME/.dotfiles/vendor/oh-my-zsh/"

# use .localrc for settings specific to one system
[[ -f ~/.localrc ]] && .  ~/.localrc

# import my customized stuff before oh-my-zsh
for f in ~/.zsh/*.zsh; do source $f; done

export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
[[ -n $ZSH_THEME ]] || export ZSH_THEME="pure"

# customize the pure prompt color
zstyle :prompt:pure:prompt:success color green

# Set to this to use case-sensitive completion
# export CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# export DISABLE_AUTO_UPDATE="true"

# Automatically update without asking
DISABLE_UPDATE_PROMPT=true

# Uncomment following line if you want to disable colors in ls
# export DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
export DISABLE_AUTO_TITLE="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(
          extract
          fzf
          git
          httpie
          macos
          pip
          python
          ruby
          rvm
          systemd
          zsh-autosuggestions
          zsh-syntax-highlighting
        )

# Path to your oh-my-zsh configuration.
source $ZSH/oh-my-zsh.sh

# source aliases again to override oh-my-zsh's
source ~/.zsh/aliases.zsh
[[ -f ~/.localrc ]] && .  ~/.localrc

unsetopt hist_verify
skip_global_compinit=1

# rebind Ctrl-p to go to beginning of line since Ctrl-a is used for screen/tmux
bindkey "\C-p" 'beginning-of-line'

PS1="$PS1"'$([ -n "$TMUX" ] && tmux setenv TMUXPWD_$(tmux display -p "#D" | tr -d %) "$PWD")'

