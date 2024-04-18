export ZSH="/Users/amer3107/.oh-my-zsh"
ZSH_THEME="daivasmara"
plugins=(git zsh-autosuggestions tmux)
ZSH_TMUX_AUTOSTART=true
eval $(thefuck --alias)
source $ZSH/oh-my-zsh.sh
alias v="nvim"
export PATH="/opt/homebrew/opt/sphinx-doc/bin:$PATH"
export PATH="/opt/homebrew/opt/bison/bin:$PATH"
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"
export PATH="$HOME/flutter/bin:$PATH"
export PATH="$PATH:/Users/amer3107/.local/bin"
eval "$(fzf --zsh)"
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS' --color=fg:#8b8d8f,bg:#1d1f27,hl:#f09383 --color=fg+:#8b8d8f,bg+:#1d1f27,hl+:#e8ab53 --color=info:#27d796,prompt:#e95678,pointer:#e95678 --color=marker:#f09383,spinner:#f09383,header:#87afaf'
