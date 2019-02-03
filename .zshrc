export ZSH=$HOME/.oh-my-zsh
source $HOME/.bash_profile

# project aliases
alias ls="ls -la"

# remote aliases

# git alias
alias gs="git status"
alias ga="git add -A"
alias gpl="git pull"
alias gps="git push"

# User
DEFAULT_USER=`whoami`

# Theme
ZSH_THEME="powerlevel9k/powerlevel9k"

# History
HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=10000
setopt appendhistory notify HIST_IGNORE_SPACE

# Neofetch
neofetch --ascii .zsh_logo.txt

# oh-my-zsh plugins
plugins=(
  docker
  docker-compose
  encode64
  git
  iterm2
  sudo
  pip
  pyenv
  virtualenv
  virtualenvwrapper
  python
  zsh-syntax-highlighting
  node
  npm
  nvm
)

# mikes' config
POWERLEVEL9K_MODE='awesome-patched'

# directory shorten
POWERLEVEL9K_SHORTEN_DIR_LENGTH=6
POWERLEVEL9K_SHORTEN_STRATEGY=truncate_from_right

# left prompt
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=('ssh' 'root_indicator' 'os_icon' 'dir' 'vcs')
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
POWERLEVEL9K_HOME_SUB_ICON=$' \UE18D '
TERM=xterm-256color
POWERLEVEL9K_OS_ICON_BACKGROUND="white"
POWERLEVEL9K_OS_ICON_FOREGROUND="blue"
POWERLEVEL9K_DIR_HOME_FOREGROUND="white"
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND="white"
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND="white"

# python virtual env function
function virtualenv_info() {
    [ $VIRTUAL_ENV ] && ECHO '('`basename $VIRTUAL_ENV`')'
}

# right prompt
POWERLEVEL9K_CUSTOM_VIRTUAL_ENV="virtualenv_info"
POWERLEVEL9K_CUSTOM_VIRTUAL_ENV_BACKGROUND="none"
POWERLEVEL9K_CUSTOM_VIRTUAL_ENV_FOREGROUND="white"
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=('custom_virtual_env')
POWERLEVEL9K_RPROMPT_ON_NEWLINE=false

source $ZSH/oh-my-zsh.sh
