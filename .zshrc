# Scripts
alias dot='~/dotfiles/dotfiles.sh'
alias path='~/dotfiles/scripts/path.sh'

# ENV
set -o vi
export BROWSER="firefox"
export ZDOTDIR="$HOME/.config/zsh"

# HISTORY

HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000

setopt HIST_IGNORE_SPACE
setopt HIST_IGNORE_DUPS
setopt SHARE_HISTORY

# PROMPT

PS1='%F{red}%~ %(?.%F{white}.%F{white})%#%f '

# AUTOCOMPLETE
autoload -Uz compinit
compinit
zstyle ':completion:*' menu select
