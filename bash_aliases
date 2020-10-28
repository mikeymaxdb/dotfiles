# bash
# vim: set ft=sh :
shopt -s expand_aliases

alias l='ls -1Fhp'
alias ll='l -l'
alias la='l -lA'
alias sudo='sudo '
alias bc='bc -l'
alias ..='cd ..'
alias update='sudo apt-get update && sudo apt-get upgrade'
alias install='sudo apt-get install'
alias untarbz2='tar xvjf'
alias dum='du -h | sort -rh | head -20'
alias df='df -H'
alias overdrive='sudo mount /dev/sdc2 ~/Usb'
alias underdrive='sudo umount ~/Usb'
alias mkdir='mkdir -pv'
alias batt='pmset -g batt'
alias battp='batt | grep -o "[0-9]\+%"'
alias hey='echo yo'
alias scrcpy='scrcpy --always-on-top --stay-awake --turn-screen-off'

alias mv='mv -i'
alias cp='cp -i'

alias e='nvim'

if [ -f ~/configuration/git_aliases ]; then
    . ~/configuration/git_aliases
fi

# Work aliases
# alias sshweb='ssh -t test "cd /www/repos/website ; bash"'
