# bash
# vim: set ft=sh :
shopt -s expand_aliases

alias sudo='sudo '
alias bc='bc -l'
alias mkdir='mkdir -pv'
alias df='df -H'
alias mv='mv -iv'
alias cp='cp -iv'
alias cat='bat'

alias l='gls -1Fhp --color=auto --group-directories-first'
alias ll='l -l'
alias la='l -lA'
alias ..='cd ..'
alias update='sudo apt-get update && sudo apt-get upgrade'
alias install='sudo apt-get install'
alias untarbz2='tar xvjf'
alias dum='du -h | sort -rh | head -20'
alias overdrive='sudo mount /dev/sdc2 ~/Usb'
alias underdrive='sudo umount ~/Usb'
alias batt='pmset -g batt'
alias battp='batt | grep -o "[0-9]\+%"'
alias hey='echo yo'
alias scrcpy='scrcpy --always-on-top --stay-awake --turn-screen-off'
alias weather='curl wttr.in'
alias netCons='lsof -i'
alias openPorts='netCons | grep LISTEN'
alias httpserv='python3 -m http.server'

alias e='nvim'

if [ -f ~/configuration/git_aliases ]; then
    . ~/configuration/git_aliases
fi

extract () {
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)   tar xjf $1     ;;
            *.tar.gz)    tar xzf $1     ;;
            *.bz2)       bunzip2 $1     ;;
            *.rar)       unrar e $1     ;;
            *.gz)        gunzip $1      ;;
            *.tar)       tar xf $1      ;;
            *.tbz2)      tar xjf $1     ;;
            *.tgz)       tar xzf $1     ;;
            *.zip)       unzip $1       ;;
            *.Z)         uncompress $1  ;;
            *.7z)        7z x $1        ;;
            *)     echo "'$1' cannot be extracted via extract()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

# Work aliases
# alias sshweb='ssh -t test "cd /www/repos/website ; bash"'
