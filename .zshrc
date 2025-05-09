eval "$(starship init zsh)"
setopt IGNORE_EOF
if [[ $OSTYPE == darwin* ]]; then
    echo "test"
    if type brew &>/dev/null
    then
        FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
    fi
    source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
    source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
    source ~/source/fzf-git.sh/fzf-git.sh

    export PATH="/opt/homebrew/opt/sphinx-doc/bin:$PATH"
    export PATH="/opt/homebrew/opt/bison/bin:$PATH"
    export PATH="/opt/homebrew/opt/libpq/bin:$PATH"
    export PATH="$PATH:/Users/amer/.local/bin"
    export PATH=/Users/amer/.nimble/bin:$PATH
    export PATH="$HOME/.local/scripts:$PATH"
    export VULKAN_PATH="/Users/amer/VulkanSDK/1.4.309.0"
    export VULKAN_SDK=$VULKAN_PATH/macOS
    export PATH=$VULKAN_SDK/bin:$PATH
    export DYLD_LIBRARY_PATH=$VULKAN_SDK/lib:$DYLD_LIBRARY_PATH
    export VK_ICD_FILENAMES=$VULKAN_SDK/share/vulkan/icd.d/MoltenVK_icd.json
    export VK_LAYER_PATH=$VULKAN_SDK/share/vulkan/explicit_layer.d
fi

bindkey '^j' autosuggest-execute
bindkey '^ ' autosuggest-accept
bindkey -s '^H' 'fg\n'

export GOPATH="$HOME/go"
export PATH="$GOPATH/bin:$PATH"
export LG_CONFIG_FILE="$HOME/.config/lazygit/config.yml"




eval "$(fzf --zsh)"
eval $(thefuck --alias)
eval "$(zoxide init zsh)"

export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND --type=d"
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS"
                        --color=fg:-1,fg+:-1,bg:-1,bg+:-1
                        --color=hl:#5ea1ff,hl+:#5ef1ff,info:#afaf87,marker:#5eff6c
                        --color=prompt:#ff5ea0,spinner:#ff5ef1,pointer:#bd5eff,header:#87afaf
                        --color=border:#262626,label:#aeaeae,query:#d9d9d9"


_fzf_compgen_path() {
    fd --exclude .git . "$1"
}

_fzf_compgen_dir() {
    fd --type=d --exclude .git . "$1"
}

alias v="nvim"
alias lg="lazygit"
alias ls="eza --color=always --long --git --no-filesize --icons=always --no-time --no-user --no-permissions"
alias cd="z"
alias g="git"
alias ga="git add ."
alias gp="git pull"
alias gd="git diff"
alias gP="git push" 
alias gf="git fetch"
alias gs="git status"

if [ "$TMUX" = "" ]; then tmux; fi
