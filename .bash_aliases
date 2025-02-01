# move
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# ls
alias ls='ls --color=auto'
alias ll='ls -lAh'
alias la='ls -A'
alias l='ls -CF'

# rm
alias rm='rm -i'
alias rmdir='rmdir -i'

# git
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gl='git log --oneline --graph --decorate --color'
alias gd='git diff'
alias gb='git branch'
alias gpo='git push origin'
alias gpl='git pull'
alias grb='git rebase'
alias start-agent='eval $(ssh-agent) && ssh-add ~/.ssh/id_rsa'
alias gitconfigulille='git config --local user.email "bastien.marache.etu@univ-lille.fr" && git config --local user.name "Bastien Marache"'
alias gitconfigperso='git config --local user.email "arizoxfr@gmail.com" && git config --local user.name "PastArizox"'

# color
alias ip='ip --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# rsx
alias myip='~/Scripts/get-ip-and-location.sh'
alias netstat='netstat -tuln'

# Dotfiles git config
alias config='/usr/bin/git --git-dir=/home/arizox/.cfg/ --work-tree=/home/arizox'

# Other
alias update='sudo apt update && sudo apt upgrade'
alias cls='clear'
alias nano='nano -c'
alias vi='vim'
alias v='vim'
alias mnt="mount | awk -F' ' '{ printf \"%s\t%s\n\",\$1,\$3; }' | column -t | egrep ^/dev/ | sort"
alias cpv='rsync -ah --info=progress2'
