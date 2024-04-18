export ZSH="/Users/amer3107/.oh-my-zsh"
ZSH_THEME="daivasmara"
plugins=(git zsh-autosuggestions tmux)
ZSH_TMUX_AUTOSTART=true
source $ZSH/oh-my-zsh.sh
alias v="nvim"
export PATH="/opt/homebrew/opt/sphinx-doc/bin:$PATH"
export PATH="/opt/homebrew/opt/bison/bin:$PATH"
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"
export PATH="$HOME/flutter/bin:$PATH"
export PATH="$PATH:/Users/amer3107/.local/bin"
eval "$(fzf --zsh)"
source ~/fzf-git.sh/fzf-git.sh
export FZF_DEFAULT_COMMAND="fd --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --strip-cwd-prefix --exclude .git"
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS' --color=fg:#8b8d8f,bg:#1d1f27,hl:#f09383 --color=fg+:#8b8d8f,bg+:#1d1f27,hl+:#e8ab53 --color=info:#27d796,prompt:#e95678,pointer:#e95678 --color=marker:#f09383,spinner:#f09383,header:#87afaf'
_fzf_compgen_path() {
    fd --exclude .git . "$1"
}

_fzf_compgen_dir() {
    fd --type=d --exclude .git . "$1"
}
eval $(thefuck --alias)
alias ls="eza --color=always --long --git --no-filesize --icons=always --no-time --no-user --no-permissions"
