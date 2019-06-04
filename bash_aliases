# bash
# vim: set ft=sh :

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

alias mv='mv -i'
alias cp='cp -i'

alias e='nvim'

# Git aliases
alias git_branch="git branch 2>/dev/null | grep '*' | sed 's/* \(.*\)/\1/'"
DEV_BRANCH='develop'

gitDeleteLocalBranches(){
    # Delete local branches that are
    # deleted in the remote repo
    git fetch -p
    for branch in `git branch -vv | grep ": gone]" | awk '{print $1}'`; do
        git branch -D $branch
    done
}

gitNewRemoteBranch(){
    # Create a new local branch
    # and publish to remote repo
    gco -b $1
    gpu
}

gitPatchDev() {
    LAST_BRANCH=$(git_branch)
    gpp
    gco "$DEV_BRANCH"
    gp
    gm "$LAST_BRANCH"
    gpp
    gco "$LAST_BRANCH"
    unset LAST_BRANCH
}

# fbr - checkout git branch
# fbr() {
#   local branches branch
#   branches=$(git branch -vv) &&
#   branch=$(echo "$branches" | fzf +m) &&
#   git checkout $(echo "$branch" | awk '{print $1}' | sed "s/.* //")
# }
# fbr - checkout git branch (including remote branches)
fbr() {
  local branches branch
  branches=$(git branch --all | grep -v HEAD) &&
  branch=$(echo "$branches" |
           fzf-tmux -d $(( 2 + $(wc -l <<< "$branches") )) +m) &&
  git checkout $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
}

alias ga='git add'
alias gaa='ga .'
alias gc='gaa && git commit -am'
alias gs='git status -s'
alias gd='git diff'
alias gp='git pull --no-edit'
alias gpp='git push'
alias gb='git branch -vv'
alias gm='git merge --no-edit'
alias gco='git checkout'
alias gcoo='fbr'
alias glo='git log --pretty=format:"%C(green)%h %Cred%d %Creset%s %n%C(yellow)%ad%Cblue %cn%n" --decorate --date=relative --graph'
alias gl='glo -10'
alias gll='gl --numstat -p'
alias gpu='gpp -u origin "$(git_branch)"'
alias gpd='gitPatchDev'
alias gfc='gc "$(git_branch)" && gpp'
alias gdrb='LAST_BRANCH=$(git_branch) && gco develop && gb -d "$LAST_BRANCH" && git push origin --delete "$LAST_BRANCH"'
alias gdlb='gitDeleteLocalBranches'
alias gnb='gitNewRemoteBranch'

# Git branch bash completion
if [ -f ~/.git-completion.bash ]; then
    . ~/.git-completion.bash

    # Add git completion to aliases
    # __git_complete g __git_main
    __git_complete gco _git_checkout
    __git_complete gm _git_merge
    __git_complete gp _git_pull
fi

# Work aliases
alias sshweb='ssh -t test "cd /www/repos/website ; bash"'

# export LS_COLORS='no=00:fi=00:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:'
