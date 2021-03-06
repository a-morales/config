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
alias gcm='git checkout $(git town main-branch)'
alias gct='git checkout -t'
alias gdi='git diff'
alias gds='git diff --stat'
alias gbr='git branch'
alias gbdm='git checkout master && git branch --merged | grep -v "* master" | grep -v "qa" | xargs git branch -d'
alias glo='git log --oneline'
alias glog="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias gfe='git fetch'
alias gmom='git merge origin/master'
alias gbim='git rebase -i origin/master'
alias gha='git-town hack'
alias gsh='git-town ship'
alias gsy='git-town sync'
alias gco='git commit'
alias gitp='git clone $(pbpaste)'
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

alias unloadKwm='launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.kwm.plist'
alias loadKwm='launchctl load ~/Library/LaunchAgents/homebrew.mxcl.kwm.plist'
alias rake='noglob rake'

alias -g .gc='--fast --ghc-options="-Wall -j +RTS -A1024m -n2m -RTS"'
