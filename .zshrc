export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="gianu_custom"

alias vim=nvim
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

plugins=(git)

source $ZSH/oh-my-zsh.sh

# Configure Pyenv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
