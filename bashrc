export PIP_DOWNLOAD_CACHE=~/.pip_cache

# append to path
export PATH=$PATH:~/bin

# virtualenvwrapper
export WORKON_HOME=~/.envs
export PROJECT_HOME=~/dev
export VIRTUALENVWRAPPER_PYTON=/usr/bin/python
[[ -s "/usr/local/bin/virtualenvwrapper.sh" ]] && source "/usr/local/bin/virtualenvwrapper.sh"

# rvm
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

# aliases
alias ls='ls -la'
alias gb='git branch'
alias gs='git status'
alias gl='git log'

PATH=$PATH:$HOME/tmp/rvm/bin # Add RVM to PATH for scripting

PATH=$PATH:$HOME/opt/rvm/bin # Add RVM to PATH for scripting
