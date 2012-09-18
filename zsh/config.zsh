# general config options 
export EDITOR='vim'
#setopt CORRECT

# load our functions
fpath=(~/.zsh/functions $fpath)
autoload -U ~/.zsh/functions/*(:t)

# history
#HISTFILE=~/.zsh_history
#HISTSIZE=1000
#SAVEHIST=1000
#REPORTTIME=10 # print elapsed time when more than 10 seconds

zle -N tab

# export node path
export NODE_PATH="$NODE_PATH:/usr/local/lib/node_modules:/usr/local/lib/node"

# bind some keys
#bindkey '^[^[[D' backward-word
#bindkey '^[^[[C' forward-word
#bindkey '^[[5D' beginning-of-line
#bindkey '^[[5C' end-of-line
#bindkey '^[[3~' delete-char
bindkey  '^[^N' tab
#bindkey '^?' backward-delete-char 


# add some irssi functions

# create the pane with irssi's nicklist
function irssi_nickpane() {
    tmux renamew irssi                                              # name the window
    tmux -q setw main-pane-width $(( $(tput cols) - 21))            # set the main pane width to the total width-20
    tmux splitw -v "cat ~/.irssi/nicklistfifo"                      # create the window and begin reading the fifo
    tmux -q selectl main-vertical                                   # assign the layout
    tmux selectw -t irssi                                           # select window 'irssi'
    tmux selectp -t 1                                               # select pane 0
}

# irssi wrapper
function irssi() {
    irssi_nickpane
    $(which irssi)                                                  # launch irssi
}

# repair running irssi's nicklist pane
function irssi_repair() {
    tmux selectw -t irssi
    tmux selectp -t 1
    tmux killp -a                                                   # kill all panes
    irssi_nickpane
}