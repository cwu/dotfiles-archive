source /etc/profile

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(
  bundler
  command-not-found
  debian
  django
  gem
  git
  heroku
  npm
  nyan
  pip
  rails
  rails3
  rake
  redis-cli
  ruby
  rvm
)

source $ZSH/oh-my-zsh.sh

################################################################################
############################### CUSTOMIZATION ##################################
################################################################################

# I don't like share history since I have terminals for specific reptitive tasks
unsetopt SHARE_HISTORY

# convenient pem file variable
PEM=/home/chris/Dropbox/aws/aws-freekey.pem

# simple git alias
alias gf='git fetch'
alias gr='git rebase origin/master master'
alias gp='git push origin master'
alias hp='git push heroku master'
alias fabd='fab -i $PEM deploy'

export EDITOR=vim

# nvm
source $HOME/.nvm/nvm.sh

# rvm
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function
