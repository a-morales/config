# Colorize output, add file type indicator, and put sizes in human readable format
alias ls='ls -GFh'

# Same as above, but in long listing format
alias ll='ls -GFhl'
alias sl='ls'

alias vim='nvim'

alias acat='< ~/.home/.zsh/aliases.zsh'
alias fcat='< ~/.home/.zsh/functions.zsh'
alias sz='source ~/.zshrc'

# aliasing less to vimpager
alias less=$PAGER
alias zless=$PAGER

# git aliases
alias gst='git status'
alias gch='git checkout'
alias gcb='git checkout -b'
alias gcm='git checkout master'
alias gcd='git checkout development'
alias gct='git checkout -t'
alias gdi='git diff'
alias gds='git diff --stat'
alias gbr='git branch'
alias gbdm='git checkout master && git branch --merged | grep -v "* master" | grep -v "qa" | xargs git branch -d'
alias glo='git log --oneline'
alias gfe='git fetch'
alias gmom='git merge origin/master'
alias gbim='git rebase -i origin/master'
alias gha='git hack'
alias gsh='git ship'
alias gsy='git sync'
alias gco='git commit'
glom() { git log --oneline origin/master.."$1" $* }
compdef _git glom=git-branch
gdm() { git diff origin/master.."$1" $* }
compdef _git gdm=git-branch
glod() { git log --oneline origin/development.."$1" $* }
compdef _git glom=git-branch
gdd() { git diff origin/development.."$1" $* }
compdef _git gdm=git-branch

alias REPLesent='scala -Dscala.color -language:_ -nowarn -i REPLesent.scala'
alias sshblog='ssh root@$BLOG_URL'

alias rd='cd $(git rev-parse --show-toplevel)'

alias unloadKwm='launchctl unload ~/Library/LaunchAgents/kwm.plist'
alias loadKwm='launchctl load ~/Library/LaunchAgents/kwm.plist'
