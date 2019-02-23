# Path to your oh-my-zsh installation.
export ZSH="/Users/dandrust/.oh-my-zsh"

ZSH_THEME="agnoster"

plugins=(git)

source $ZSH/oh-my-zsh.sh

# Personal Aliases
alias zshconfig="vi ~/.zshrc"
alias la="ls -la"
alias code="cd ~/code"
alias ctags="`brew --prefix`/bin/ctags"
alias vimconfig="vi ~/.vimrc"
alias tmuxconfig='vi ~/.tmux.conf'
