export ZSH="$HOME/.oh-my-zsh"
export ZSH_CONFIG="$HOME/.config/zsh"

fpath=(~/.config/zsh/completion ~/.config/zsh/functions $fpath)
ZSH_THEME="robbyrussell"
CASE_SENSITIVE="true"
DISABLE_AUTO_UPDATE="true"
plugins=(git)

source $ZSH/oh-my-zsh.sh
source $ZSH_CONFIG/private

compinit

# show completion menu when number of options is at least 2
zstyle ':completion:*' menu select=2

alias bc='bc -lq'
alias news='newsboat'
alias curltor='curl -L -C - --retry 999 --retry-max-time 60 --proxy socks5://localhost:9050'

alias qvim='nvim-qt'
