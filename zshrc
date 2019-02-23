export ZSH=/Users/dandrust/.oh-my-zsh
export PATH="/usr/local/opt/mysql@5.5/bin:$PATH"
alias ctags="`brew --prefix`/bin/ctags"

ZSH_THEME="agnoster"

plugins=(git)

source $ZSH/oh-my-zsh.sh

alias la='ls -la'

# Source code shortcuts
alias code='cd ~/code'
alias vl='cd ~/votelocal'
alias chews='cd ~/code/chews_life'

# Git shortcuts
alias gits='git status'
alias gitb='git branch'
alias gitch='git checkout'
alias gitnb='git checkout -b'
alias gitc='git commit -m'
alias gita='git add . && git status'
alias gpush='git push origin'
alias gpull='git pull origin'

# Dotfiles shortcuts
alias zshconfig="vi ~/.zshrc"
alias ohmyzsh="vi ~/.oh-my-zsh"
alias tmuxconfig="vi ~/.tmux.conf"
alias vimconfig='vi ~/.vimrc'

alias hosts='sudo vi /etc/hosts'

# Roommates shortcuts
alias rm-sc="heroku run rails c --app=roommates-my-staging"
alias rm-pc="heroku run rails c --app=roommates-my-production"

# Baker store shortcuts
alias baker.edit="open_baker"
alias baker.staging.logs="heroku logs -tail -a bakerbookstore-staging"
alias baker.staging.console="heroku run rails c --app=bakerbookstore-staging"
alias baker.production.logs="heroku logs -tail -a bakerbookstore-production"
alias baker.production.console="heroku run rails c --app=bakerbookstore-production"
alias baker.e="baker.edit"
alias baker.sl="baker.staging.logs"
alias baker.sc="baker.staging.console"
alias baker.pl="baker.production.logs"
alias baker.pc="baker.production.console"

open_baker() {
  # Just attach to the existing session if it exists
  if tmux has-session -t baker; then
    tmux attach -t baker
  fi

  tmux new-session -d -c ~/code/bakerbookstore -n bakerbookstore -s baker vi
  tmux new-window -d -n solidus-core -c ~/code/solidus_core-2.6.0  -t bakerbookstore -a vi
  tmux new-window -d -n solidus-frontend -c ~/code/solidus_frontend-2.6.0 -t solidus-core -a vi
  tmux set-environment -t baker PROJECT baker
  # tmux new-window -d -n staging 'source ~/.zshrc && heroku logs -tail -a `heroku_app_by_project $PROJECT`-staging'
  # tmux split-window -d 'source ~/.zshrc && heroku run rails c -a `heroku_app_by_project $PROJECT`-staging'
  tmux attach -t baker
}

# Custom functions
heroku_app_by_project() {
  case $1 in
  (baker)
  echo 'bakerbookstore'
   ;;
  (roommates)
   echo 'roommates-my'
   ;;
  esac
}
