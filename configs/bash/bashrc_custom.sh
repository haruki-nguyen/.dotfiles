#!/bin/bash
 
# Add system updating script
source ~/.dotfiles/configs/bash/update-system.sh

# Add search and replace script
source ~/.dotfiles/configs/bash/search-replace.sh

# Prompt theme
eval "$(starship init bash)"

# Z directory jumper
source ~/.dotfiles/configs/bash/z.sh

# Alias
alias md="mkdir -p"
alias t="touch"
alias refsh="source ~/.bashrc"

alias g="git"
alias gs="git status"
alias gl="git log --graph --oneline --decorate"
alias gaa="git add ."
alias ga="git add"
alias gcm="git commit -m"
alias gc="git commit"
alias gpl="git pull --rebase"
alias gps="git pull --rebase & git push"
alias gitui="gitui -t catppuccin_mocha.ron"
alias gcz="git cz"

# Add PATH
export PATH="/home/haruki/.cargo/bin:/home/haruki/.local/bin:$PATH"

