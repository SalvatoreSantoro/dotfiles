# ZSH
# PROMPT
# Your normal interactive shell configuration goes here

autoload -Uz vcs_info
precmd() { vcs_info }

zstyle ':vcs_info:git:*' formats '(%b)'  # Show Git branch in parentheses
zstyle ':vcs_info:*' enable git

PS1='%F{red}%~%F{green}${vcs_info_msg_0_}%f %(?.%F{white}.%F{white})%#%f '
export ZSH="$HOME/.oh-my-zsh"
export FZF_BASE="/usr/bin/fzf"
export PATH="/opt/riscv64/bin:/opt/riscv32/bin:$HOME/.cargo/bin:/opt/cuda/bin:/opt/cuda:/tools/Xilinx/Vivado/2024.2/bin:$PATH"

#export ELECTRON_OZONE_PLATFORM_HINT=auto
#export QT_QPA_PLATFORM=wayland
#export QT_SCALE_FACTOR=1
#export QT_WAYLAND_FORCE_DPI="physical" 
#export QT_QPA_PLATFORMTHEME=qt5ct
# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
#ZSH_THEME="random"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
#DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
#ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"
# 
# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"
# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"
# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder
# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git fzf zsh-interactive-cd zsh-autosuggestions zsh-syntax-highlighting)
export ZSH_COMPDUMP=$ZSH/cache/.zcompdump-$HOST
source $ZSH/oh-my-zsh.sh
#source <(fzf --zsh)
# User configuration
# export MANPATH="/usr/local/man:$MANPATH"
# You may need to manually set your language environment
export LANG=it_IT.UTF-8
# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
# Scripts
scriptsHome="~/dotfiles/scripts"
alias dot='~/dotfiles/dotfiles.sh'
alias path="$scriptsHome/path.sh"
alias run_discord="$scriptsHome/run_discord.sh"
alias docker_psa="$scriptsHome/docker_psa.sh"
alias docker_stop_all="$scriptsHome/docker_stop_all.sh"
alias remove="$scriptsHome/remove.sh"
alias sway_launch="$scriptsHome/sway_launcher.sh"
alias u_config="~/dotfiles/ubuntu_22.04/scripts/UninaSoC_setup.sh"

#for C project
#see https://github.com/rizsotto/Bear
alias b="bear -- make"
alias bc="bear -- make clean"
alias br="bear -- make run"
alias y="ranger"
# ENV
alias ta="tar -xvjf"
set -o vi
#export BROWSER="firefox"
#export ZDOTDIR="$HOME/.config/zsh"

# HISTORY
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000
setopt HIST_IGNORE_SPACE
setopt HIST_IGNORE_DUPS
setopt SHARE_HISTORY

fcd() {
  local target_dir="${1:-$HOME}"  # Specify the default directory
  local selected_dir=$(find "$target_dir" -type d 2>/dev/null | fzf --prompt="Select directory: ")

  if [[ -n "$selected_dir" ]]; then
    cd "$selected_dir"
    zle reset-prompt  # Refresh prompt to show the new directory
  fi
}

neovim() {
    nvim .
}


zle -N fcd
zle -N neovim

bindkey '^F' fcd
bindkey '^E' neovim

