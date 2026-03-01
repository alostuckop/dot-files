# Oh My Zsh
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="gianu"
plugins=(git pyenv)
source $ZSH/oh-my-zsh.sh

# Alias
alias vim=nvim
alias python=python3

# Neovim
autoload -Uz history-search-backward
bindkey '\ek' history-search-backward

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
