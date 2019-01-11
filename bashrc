# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# Enable colors
export CLICOLOR=1

export PATH="$PATH:$HOME/bin"
export PATH="$PATH:$HOME/configuration/scripts"

# Don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth

# Append to the history file, don't overwrite it
shopt -s histappend

# For setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# Check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Check if we're in an ssh session
if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
  SERV='^'
else
  SERV=''
fi

# Get the current git branch
alias git_ps1="git branch 2>/dev/null | grep '*' | sed 's/* \(.*\)/ [\1]/'"

PS1='\[\033[0;34m\]\w\[\033[00;32m\]$(git_ps1)\[\033[00m\] \$$SERV '

if [ -f ~/configuration/bash_aliases ]; then
    . ~/configuration/bash_aliases
fi

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
export FZF_DEFAULT_COMMAND='rg --files --no-ignore-vcs --hidden'
