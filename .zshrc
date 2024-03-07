export ZSH="/Users/amer3107/.oh-my-zsh"
ZSH_THEME="daivasmara"
plugins=(git zsh-autosuggestions tmux)
ZSH_TMUX_AUTOSTART=true
eval $(thefuck --alias)
source $ZSH/oh-my-zsh.sh
alias vim="nvim"
export PATH="/opt/homebrew/opt/sphinx-doc/bin:$PATH"
export PATH="/opt/homebrew/opt/bison/bin:$PATH"
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"
export PATH="$HOME/flutter/bin:$PATH"
