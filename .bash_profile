# Settings

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
export TERM=xterm-256color
export DISABLE_SPRING=true

# Aliases

alias vi=vim
alias vimrc='vim ~/.vim/vimrc'
alias sourceb='source ~/.bash_profile'
alias bashp='vim ~/.bash_profile'
alias tmuxv='vim ~/.tmux.conf'
alias dl='cd ~/Downloads'
alias docs='cd ~/Documents'
alias ls='ls -GFh'
alias proj='cd ~/projects'
alias fzv='vim $(fzf)'
alias fim='vim -o fzf'

# fd - Find any directory and cd to selected directory
fd() {
 local dir
 dir=$(find ${1:-.} -path '*/\.*' -prune -o -type d \
      -print 2> /dev/null | fzf +m) &&
 cd "$dir"
}

# Env Specific
alias be='bundle exec'

# OpsLevel Specific
alias ops='cd ~/projects/OpsLevel'
alias opsj='cd ~/projects/OpsLevel/app/javascript/packs'
alias opa='cd ~/projects/OpsLevel/app'

# Katsudo Specific
alias kat='cd ~/projects/katsudo'
alias katb='cd ~/projects/katsudo/katsudo'
alias katu='cd ~/projects/katsudo/katsudo-ui'

# Relative Dev Aliases
alias yi='yarn install'
alias creds='EDITOR=vim rails credentials:edit'

# Rails specific Aliases
alias dbm='be rake db:migrate'
alias dbmt='be rake db:migrate RAILS_ENV=test'
alias rfix="git diff --name-only --diff-filter=d origin/master... | xargs rubocop --auto-correct --force-exclusion"
alias rch="git diff --name-only --diff-filter=d origin/master... | xargs rubocop --force-exclusion"
alias rtest='be rails test -v'
alias rc='be rails console'

# Javascript specific Aliases
alias jfix="git diff --name-only --diff-filter=d origin/master...  -- 'app/*.js' 'app/*.vue' 'test/*.js' | xargs  eslint --fix"
alias jch="git diff --name-only --diff-filter=d origin/master...  -- 'app/*.js' 'app/*.vue' 'test/*.js' | xargs  eslint"

# Git Aliases
alias grm="git rebase master"
alias gr3="git rebase -i HEAD~3"
alias gcr="git commit -m 'REBASE'"

# NodeEnv Setup

eval "$(nodenv init -)"

# Shows the current git branch in the terminal
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\u@\h \[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "

# Auto complete git branches
# To auto complete: curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -o ~/.git-completion.bash

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


export FZF_DEFAULT_OPTS='--height=70% --multi --preview="bat --style=numbers --color=always {}" --preview-window=right:60%:wrap'
export FZF_DEFAULT_COMMAND='rg --hidden --files'
export FZF_CTRL_T_COMMAND='$FZF_DEFAULT_COMMAND'
