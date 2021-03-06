# Path to your oh-my-zsh installation.
#export ZSH="/home/tom/.config/zsh/ohmyzsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
#ZSH_THEME="crunch"
ZSH_THEME="tom"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

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
plugins=(git)

source "$ZSH/oh-my-zsh.sh"

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=de_DE.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# ZSH Settings
autoload -z edit-command-line
zle -N edit-command-line
bindkey '^e' edit-command-line
setopt share_history
setopt inc_append_history

# Prompt
#autoload -U colors && colors
#source ~/repos/zsh-git-prompt/zshrc.sh
#PROMPT='%n%f@%F{blue}%B%m%f %~%b%f $(git_super_status) %# '

## Auto Completion
#autoload -Uz compinit compinit
#zstyle ':completion:*' menu select
#setopt COMPLETE_ALIASES

[[ $(fgconsole 2>/dev/null) == 1 ]] && exec startx -vt1

# Alias
[ -f $HOME/.scripts/.generate-alias ] && $HOME/.scripts/.generate-alias "posix" | source /dev/stdin
alias udo="/usr/bin/sudo"

# Envvars
[ -f $HOME/.scripts/.generate-envvars ] && $HOME/.scripts/.generate-envvars "posix" | source /dev/stdin

# syntax highlighting
[ -f ~/repos/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ] && source ~/repos/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Setup fzf
# ---------
if [[ ! "$PATH" == */home/tom/repos/fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/tom/repos/fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/tom/repos/fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/tom/repos/fzf/shell/key-bindings.zsh"

source ~/.scripts/fuzzy
