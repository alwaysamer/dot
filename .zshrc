setopt IGNORE_EOF

export ZSH="/Users/amer/.oh-my-zsh"
ZSH_THEME="daivasmara"
plugins=(git zsh-autosuggestions tmux fzf-tab copypath)
ZSH_TMUX_AUTOSTART=true

source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $ZSH/oh-my-zsh.sh
source ~/source/fzf-git.sh/fzf-git.sh

export PATH="/opt/homebrew/opt/sphinx-doc/bin:$PATH"
export PATH="/opt/homebrew/opt/bison/bin:$PATH"
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"
export PATH="$HOME/flutter/bin:$PATH"
export PATH="$PATH:/Users/amer/.local/bin"

eval "$(fzf --zsh)"
eval $(thefuck --alias)
eval "$(zoxide init zsh)"

export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND --type=d"
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS"
                        --color=fg:#8b8d8f,bg:#1d1f27,hl:#f09383 
                        --color=fg+:#8b8d8f,bg+:#1d1f27,hl+:#e8ab53 
                        --color=info:#27d796,prompt:#e95678,pointer:#e95678 
                        --color=marker:#f09383,spinner:#f09383,header:#87afaf"

_fzf_compgen_path() {
    fd --exclude .git . "$1"
}

_fzf_compgen_dir() {
    fd --type=d --exclude .git . "$1"
}

alias v="nvim"
alias ls="eza --color=always --long --git --no-filesize --icons=always --no-time --no-user --no-permissions"
alias cd="z"
