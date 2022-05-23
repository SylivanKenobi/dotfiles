# Dont try to display a fancy theme in a tty
if [[ $TERM == "linux" ]] || [[ $TERM == "screen" ]]; then
  [[ ! -f ~/.p10k-portable.zsh ]] || source ~/.p10k-portable.zsh
else
  [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
fi

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Move one word left or right using alt
bindkey "[D" backward-word
bindkey "^[h" backward-word
bindkey "[C" forward-word
bindkey "^[l" forward-word

# Aliases
alias ls="ls --color=auto"
alias lsblk="lsblk -o +LABEL"
alias ip="ip -c"
alias showip="ip --brief a"
alias ssh='TERM=xterm ssh'
alias ll="ls -l"
alias code="vscodium"
alias gst="git status"

# Lines configured by zsh-newuser-install
bindkey -e

plugins=(git zsh-autosuggestions)

# History config
HIST_IGNORE_DUPS="true"
HIST_STAMPS="dd/mm/yyyy"
HISTFILE=~/.zsh_history
HISTSIZE=999999999
SAVEHIST=$HISTSIZE
setopt SHARE_HISTORY

# Autocompletion behaviour
autoload -Uz compinit; compinit
zstyle ':completion:*' menu select

# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/sylvain/.zshrc'

autoload -Uz compinit
compinit

export PATH="$PATH:$HOME/.rvm/bin"
[[ /usr/bin/kubectl ]] && source <(kubectl completion zsh)


# End of lines added by compinstall
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
