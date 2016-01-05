autoload colors; colors

# The variables are wrapped in %{%}. This should be the case for every
# variable that does not contain space.
for COLOR in RED GREEN YELLOW BLUE MAGENTA CYAN BLACK WHITE; do
  eval COLOR_$COLOR='%{$fg_no_bold[${(L)COLOR}]%}'
  eval COLOR_B$COLOR='%{$fg_bold[${(L)COLOR}]%}'
done

eval COLOR_RESET='%{$reset_color%}'
export COLOR_RED COLOR_GREEN COLOR_YELLOW COLOR_BLUE COLOR_WHITE COLOR_BLACK
export COLOR_BRED COLOR_BGREEN COLOR_BYELLOW COLOR_BBLUE
export COLOR_BWHITE COLOR_BBLACK COLOR_RESET

# Clear LSCOLORS
unset LSCOLORS

# Main change, you can see directories on a dark background
#export LSCOLORS=gxfxcxdxbxegedabagacad

export CLICOLOR=1
export LS_COLORS=exfxcxdxbxegedabagacad
