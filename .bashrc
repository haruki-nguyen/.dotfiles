# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc

# My custom scripts
# Add custom scripts
source ~/.dotfiles/.config/bash/update-system.sh
source ~/.dotfiles/.config/bash/z.sh

# Alias
alias md="mkdir -p"
alias t="touch"
alias refresh="source ~/.bashrc && cd ~/.dotfiles && stow . && cd -"
alias py="python3"

# Git alias
alias gits="git status"
alias gitl="git log --graph --oneline --decorate"
alias gitaa="git add ."
alias gita="git add"
alias gitc="git commit"
alias gitpr="git pull --rebase"
alias gitsync="git pull --rebase && git push"

