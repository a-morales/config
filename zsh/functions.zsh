function exists { which $1 &> /dev/null }

path() {
  echo $PATH | tr ":" "\n" | \
    awk "{ sub(\"/usr\",   \"$fg_no_bold[green]/usr$reset_color\"); \
           sub(\"/bin\",   \"$fg_no_bold[blue]/bin$reset_color\"); \
           sub(\"/opt\",   \"$fg_no_bold[cyan]/opt$reset_color\"); \
           sub(\"/sbin\",  \"$fg_no_bold[magenta]/sbin$reset_color\"); \
           sub(\"/local\", \"$fg_no_bold[yellow]/local$reset_color\"); \
           print }"
}

function clean {
  find . -name "$1" -exec rm -r "{}" \;
}

function airportcycle {
  networksetup -setairportpower en0 off;
  networksetup -setairportpower en0 on;
}

function vpn-connect {
/usr/bin/env osascript <<-EOF
tell application "System Events"
  set status to do shell script "scutil --nc status RMS"
  if status does not start with "Connected" then
    do shell script "scutil --nc start RMS"
    delay 2
    keystroke (system attribute "RMS_VPN_PASS")
    keystroke return
  else
    log "Already Connected"
  end if
end tell
EOF
}

fd() {
  local dir
  dir=$(find . -path '*/\.*' -prune -o -type d -print 2> /dev/null |  fzf-tmux +m -q "$1") && cd "$dir"
}

cdf() {
   local file
   file=$(fzf-tmux +m -q "$1") && cd $(dirname "$file")
}

vif() {
  local file
  file=$(fzf-tmux --query="$1" --select-1 --exit-0)
  [ -n "$file" ] && ${EDITOR:-vim} "$file"
}

checkGitStatus() {
git remote update &> /dev/null
LOCAL=$(git rev-parse @)
REMOTE=$(git rev-parse @{u})
BASE=$(git merge-base @ @{u})

if [ $LOCAL = $REMOTE ]; then
    echo "Up to date"
elif [ $LOCAL = $BASE ]; then
    echo "Need to pull"
elif [ $REMOTE = $BASE ]; then
    echo "Need to push"
else
    echo "Diverged"
fi
}

gpip() {
  PIP_REQUIRE_VIRTUALENV="" pip "$@"
}

