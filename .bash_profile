# Settings

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
export TERM=xterm-256color

# Aliases

alias vimrc='vim ~/.vim/vimrc'
alias sourceb='source ~/.bash_profile'
alias bashp='vim ~/.bash_profile'
alias tmuxv='vim ~/.tmux.conf'
alias dl='cd ~/Downloads'
alias docs='cd ~/Documents'
alias ls='ls -GFh'
alias kat='cd ~/projects/katsudo'
alias katb='cd ~/projects/katsudo/katsudo'
alias katu='cd ~/projects/katsudo/katsudo-ui'
alias proj='cd ~/projects'
alias fzv='vim $(fzf)'

# NodeEnv Setup

eval "$(nodenv init -)"

# Shows the current git branch in the terminal
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\u@\h \[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "
