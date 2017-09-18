# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

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


# Set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# Set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
  SERV='^'
else
  SERV=''
fi

alias git_branch="git branch 2>/dev/null | grep '*' | sed 's/* \(.*\)/\1/'"
alias git_ps1="git branch 2>/dev/null | grep '*' | sed 's/* \(.*\)/ [\1]/'"

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[0;34m\]\w\[\033[00;32m\]$(git_ps1)\[\033[00m\] \$$SERV '
else
    PS1='${debian_chroot:+($debian_chroot)}\u:\w\$ '
fi
unset color_prompt force_color_prompt


# Enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls -color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

export LS_COLORS='no=00:fi=00:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:'

# Aliases
alias ls='ls -G'
alias ll='ls -lpFh'
alias sudo='sudo '
alias la='ls -lapFh'
alias ..='cd ..'
alias update='sudo apt-get update && sudo apt-get upgrade'
alias install='sudo apt-get install'
alias untarbz2='tar xvjf'
alias l='ls'
alias dum='du -h | sort -rh | head -20'
alias df='df -h'
alias overdrive='sudo mount /dev/sdc2 ~/Usb'
alias underdrive='sudo umount ~/Usb'
alias mkdir='mkdir -pv'
alias batt='pmset -g batt'

alias mv='mv -i'
alias cp='cp -i'
alias ln='ln -i'

# Git aliases
alias gc='git commit -am'
alias gs='git status -s'
alias gd='git diff'
alias gp='git pull --no-edit'
alias gpp='git push'
alias gb='git branch -vv'
alias gm='git merge --no-edit'
alias ga='git add'
alias gaa='ga .'
alias gco='git checkout'
alias glo='git log --pretty=format:"%C(green)%h %Cred%d %Creset%s %n%C(yellow)%ad%Cblue %cn%n" --decorate --date=relative --graph'
alias gl='glo -10'
alias gll='gl --numstat -p'
alias gpu='gpp -u origin "$(git_branch)"'
alias gpd='LAST_BRANCH=$(git_branch) && gpp && gco dev && gp && gm "$LAST_BRANCH" && gpp && gco "$LAST_BRANCH"'
alias gfc='gc "$(git_branch)" && gpp'
alias gdrb='LAST_BRANCH=$(git_branch) && gco rc && gb -d "$LAST_BRANCH" && git push origin "$LAST_BRANCH"'

# Work aliases
alias sshweb='ssh -t test "cd /www/repos/website ; bash"'
alias sshhub='ssh -t test "cd /www/repos/hub ; bash"'
alias ssheditor='ssh -t test "cd /www/repos/editor/Editor ; bash"'

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi


# Enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
