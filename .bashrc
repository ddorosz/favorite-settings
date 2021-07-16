
# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

if [ -f $HOME/.bash_aliases ]
then
	. $HOME/.bash_aliases
fi

# Aliases
alias be='bundle exec'
alias ops='cd /Users/ddorosz/projects/OpsLevel/'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
