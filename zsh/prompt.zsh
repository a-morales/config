function git_prompt_info {
  local ref=$(=git symbolic-ref HEAD 2> /dev/null)
  local gitst="$(=git status 2> /dev/null)"
  local pairname=${${${GIT_AUTHOR_EMAIL#pair+}%@github.com}//+/\/}
  if [[ ${pairname} == 'ch' || ${pairname} == '' ]]; then
    pairname=''
  else
    pairname=" ($pairname)"
  fi

  if [[ -f .git/MERGE_HEAD ]]; then
    if [[ ${gitst} =~ "unmerged" ]]; then
      gitstatus="$COLOR_RED unmerged$COLOR_RESET"
    else
      gitstatus="$COLOR_GREEN merged$COLOR_RESET"
    fi
  elif [[ ${gitst} =~ "Changes to be committed" ]]; then
    gitstatus="$COLOR_BLUE!"
  elif [[ ${gitst} =~ "use \"git add" ]]; then
    gitstatus="$COLOR_RED!"
  elif [[ -n `git checkout HEAD 2> /dev/null | grep ahead` ]]; then
    gitstatus="$COLOR_YELLOW*"
  else
    gitstatus="$COLOR_GREEN"
  fi

  if [[ -n $ref ]]; then
    echo "$gitstatus(${ref#refs/heads/})$COLOR_RESET"
  fi
}

PROMPT='${COLOR_BCYAN}${PWD/#$HOME/~}${COLOR_RESET} ${COLOR_GREEN}→${COLOR_RESET} '
RPROMPT='$(git-radar --zsh --fetch)'
