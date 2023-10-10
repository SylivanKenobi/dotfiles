# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/usr/share/oh-my-zsh"

plugins=(git zsh-autosuggestions oc)

source $ZSH/oh-my-zsh.sh

export EDITOR='vim'

alias ls="ls --color=auto"
alias lsblk="lsblk -o +LABEL"
alias ip="ip -c"
alias showip="ip --brief a"
alias ssh='TERM=xterm ssh'
alias ll="ls -l"
alias code="vscodium"
alias gst="git status"
alias tog="cd ~/Documents/git"
alias docked="~/.screenlayout/docked.sh"
alias undocked="~/.screenlayout/undocked.sh"
alias loud="~/.i3/audio.sh speackers"
alias quiet="~/.i3/audio.sh headset"
# History config
HIST_IGNORE_DUPS="true"
HIST_STAMPS="dd/mm/yyyy"
HISTFILE=~/.zsh_history
HISTSIZE=999999999
SAVEHIST=$HISTSIZE
setopt SHARE_HISTORY

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

[[ /usr/bin/kubectl ]] && source <(kubectl completion zsh)

source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
