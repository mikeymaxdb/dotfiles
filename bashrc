# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Enable colors
export CLICOLOR=1
export BAT_THEME='gruvbox-dark'

export PATH="$PATH:$HOME/bin"
export PATH="$PATH:$HOME/configuration/scripts"
export PATH="$PATH:$HOME/.npm/bin"
export PATH="$PATH:$HOME/.local/bin"

# Set the editor to neovim
export VISUAL=nvim
export EDITOR="$VISUAL"

# Don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth

# For setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

if [ -n "$BASH_VERSION" ]; then
    # Append to the history file, don't overwrite it
    shopt -s histappend

    # Check the window size after each command and, if necessary,
    # update the values of LINES and COLUMNS.
    shopt -s checkwinsize

    # Use vi-style keybindings in the prompt
    # set -o vi
fi

# Check if we're in an ssh session
if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
  SERV='^'
else
  SERV=''
fi

# Get the current git branch
getGitPrompt() {
    local stat="$(git status -s 2> /dev/null)"
    local branch="$(git rev-parse --abbrev-ref HEAD 2>/dev/null)"
    local prompt=""

    if [ -n "$branch" ]; then
        prompt=" ("
        prompt="$prompt$branch"

        if [ -n "$stat" ]; then
            prompt="$prompt*"
        fi

        prompt="$prompt)"
    fi

    echo "${prompt}"
}

PROMPT_DECOR="└──"
NEWLINE=$'\n'

if [ -n "$BASH_VERSION" ]; then
    DIR_COLOR="\[\033[0;34m\]"
    GIT_COLOR="\[\033[1;35m\]"
    PROMPT_COLOR="\[\033[1;35m\]"
    CLEAR_COLOR="\[\033[0m\]"
    DIRECTORY="\w"
    HOST="\h"
    PS1_PROMPT="\$$SERV"

    PS1="
${DIR_COLOR}${DIRECTORY}\
${GIT_COLOR}\$(getGitPrompt)
${PROMPT_COLOR}${PROMPT_DECOR} \
${PS1_PROMPT} ${CLEAR_COLOR}"

    [ -f ~/.fzf.bash ] && source ~/.fzf.bash
elif [ -n "$ZSH_VERSION" ]; then
    autoload -Uz compinit && compinit
    setopt PROMPT_SUBST # Expand the PS1 string
    PS1="${NEWLINE}%F{blue}%/%F{175}\$(getGitPrompt)${NEWLINE}${PROMPT_DECOR} $%f "
    eval "$(direnv hook zsh)"
fi

if [ -f ~/configuration/bash_aliases ]; then
    . ~/configuration/bash_aliases
fi

export FZF_DEFAULT_COMMAND='rg --files --no-ignore-vcs --hidden'
export FZF_DEFAULT_OPTS="--ansi --preview-window 'right:60%' --preview 'bat
--color=always --style=header,grid --line-range :300 {}' --bind
ctrl-a:select-all --color border:109"

# export LS_COLORS='no=00:fi=00:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:'
