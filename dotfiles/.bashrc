#
# ~/.bashrc
#

# INSTALAR: eza, scrot, bat, ccat, meter git-prompt.sh, zoxide

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# eza --icons: por si no se diferencia bien con los colores
alias ls='eza -H'
alias tree='ls -T'
alias ll='ls -l'
alias la='ls -a'
alias grep='grep --color=auto'
alias scrot='scrot -e "mkdir -p ~/Images/Screenshots/" ~/Images/Screenshots/"%Y-%m-%d_%H:%M:%S.png"'
alias scrots='scrot -s'
alias show-keys='xev'

alias ccat='ccat -G Plaintext="blink" -G Keyword="purple" -G String="darkgreen" -G Punctuation="brown" -G Comment="faint"'
alias cat='bat'
alias caty='cat -l$1'
alias catnl='cat --paging=never'
alias catynl='catnl -l$1'

alias icat='kitty +kitten icat'
alias d='kitty +kitten diff'
alias unicode='kitty +kitten unicode_input'

alias shutdown='shutdown now'
alias fix='setxkbmap es'
alias update='sudo pacman -Syu; fix'
alias ?='history | grep'

alias open=xdg-open

alias neofetch='neofetch --config ~/.config/neofetch/boxes.conf'
alias dotfiles="git --git-dir $HOME/.dotfiles/ --work-tree $HOME"
alias dot="dotfiles"
alias tod="tig -C $HOME/.dotfiles"

alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
alias spotify='spt'

if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

if [ -f ~/.bash_functions ]; then
  . ~/.bash_functions
fi

if [[ -r /usr/share/bash-completion/bash_completion ]]; then
  . /usr/share/bash-completion/bash_completion
fi

what () {
  curl cheat.sh/$1
}

mkcd () {
  mkdir -p -- "$1" && cd -P -- "$1"
}

nano() {
  if [ ! -e "$1" ] || [ -w "$1" ]; then
    /bin/nano -T4 $1
  else
    echo "Editing $1 requires root permission"
    /bin/sudoedit $1
  fi
}

source ~/.git-prompt.sh
# PS1='\[$(tput sc; rightprompt; tput rc)\]\e[0;32m[\u@\h \W]\$ \e[0m'
export GIT_PS1_SHOWDIRTYSTATE=1
export PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[33m\]$(__git_ps1 "(%s)")\[\033[37m\]\$\[\033[00m\] '
# export PS1='\[\033[01;32m\]\W\[\033[00m\] \[\033[01;34m\]$\[\033[33m\] ';

export PATH="$PATH:/home/fabri/.local/bin"
export TOKEN="eyJhbGciOiJIUzUxMiJ9.eyJyb2xlcyI6WyJWSUNFUlJFQ1RPUkFETyIsIkNPUlJFQ1RPUiJdLCJzdWIiOiJ1c2VyIiwiaWF0IjoxNjcyNTI3NjAwLCJleHAiOjE5ODgxNDY4MDB9.4e4pTFYwSxy81WAFpAM33UsaTA4FQMgiT43QZVsf8XMr5IsZmuRpaC68O6233BYGFaXhe9DNwQEMA8F_6wYUFg"
export OBSWD="/home/fabri/Docs/Obsidian-Vault"

# HISTSIZE > HISTFILESIZE
HISTSIZE=5000
HISTFILESIZE=1000
#HISTCONTROL=ignoreboth
HISTCONTROL="ignoreboth" #:erasedups"

shopt -s histappend

# '&': ignoredups, '[ ]*': ignorespace
export HISTIGNORE="&:[ ]*:exit:ls:cd:clear"

# Save and reload the history after each command finishes
# export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

eval "$(zoxide init bash --cmd cd)"

#eval "$(starship init bash)"


# Load Angular CLI autocompletion.
source <(ng completion script)

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
. "$HOME/.cargo/env"
