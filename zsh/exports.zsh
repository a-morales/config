# Setup terminal, and turn on colors
export CLICOLOR=1
export LSCOLORS=Gxfxcxdxbxegedabagacad

# Enable color in grep
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='3;33'

# This resolves issues install the mysql, postgres, and other gems with native non universal binary extensions
export ARCHFLAGS='-arch x86_64'

export LESS='--ignore-case --raw-control-chars'
export PAGER='vimpager'
export EDITOR='nvim'
export VISUAL='nvim'

# CTAGS Sorting in VIM/Emacs is better behaved with this in place
export LC_COLLATE=C

export HOMEBREW_CASK_OPTS="--appdir=/Applications"
export JAVA_HOME="$(/usr/libexec/java_home)"
export ANDROID_HOME="/usr/local/opt/android-sdk"
export STUDIO_JDK="/Library/Java/JavaVirtualMachines/jdk1.8.0_25.jdk"

export SBT_OPTS="$SBT_OPTS -Dsbt.jse.engineType=Node"

export NVIM_TUI_ENABLE_TRUE_COLOR=1

export GOPATH="$HOME/.go"
export PIP_REQUIRE_VIRTUALENV=true

export PATH=/usr/local/texlive/2015basic/bin/x86_64-darwin:/usr/local/bin:/usr/bin:/bin:$HOME/.bin:./node_modules/.bin:/usr/sbin:/sbin:$GOPATH/bin:/usr/local/sbin:bin:$PATH
