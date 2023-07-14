if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="/Users/amer/.oh-my-zsh"
export TERM=xterm-256color
ZSH_THEME="daivasmara"
plugins=(git zsh-autosuggestions tmux)
ZSH_TMUX_AUTOSTART=true
source $ZSH/oh-my-zsh.sh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
export PATH="/opt/homebrew/opt/sphinx-doc/bin:$PATH"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

fpath=($fpath "/Users/amer/.zfunctions")

export PATH="/opt/homebrew/opt/bison/bin:$PATH"
