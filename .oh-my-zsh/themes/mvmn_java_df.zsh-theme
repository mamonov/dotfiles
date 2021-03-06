# ZSH Theme - Preview: http://cl.ly/f701d00760f8059e06dc
# Thanks to gallifrey, upon whose theme this is based

local return_code="%(?..%{$fg_bold[red]%}%? ↵%{$reset_color%})"
local java_version='$(java -version 2>&1 | head -n 1 | cut -d \" -f 2)'
local free_space='$(df -H . | tail -n 1 | awk "{ print \$4\"/\"\$2 }")'

function my_git_prompt_info() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  GIT_STATUS=$(git_prompt_status)
  [[ -n $GIT_STATUS ]] && GIT_STATUS=" $GIT_STATUS"
  echo "$ZSH_THEME_GIT_PROMPT_PREFIX${ref#refs/heads/}$GIT_STATUS$ZSH_THEME_GIT_PROMPT_SUFFIX"
}

PROMPT='%{$fg_bold[green]%}%n@%m%{$reset_color%} %{$fg_bold[blue]%}%2~%{$reset_color%} $(my_git_prompt_info)%{$reset_color%}%B»%b '
#PROMPT='%{$fg_bold[green]%}%n@%m%{$reset_color%} %{$fg_bold[white]%}[%D{%a %H:%M:%S}]%{$reset_color%} %{$fg_bold[blue]%}%2~%{$reset_color%} $(my_git_p$
#PROMPT='%{$fg_bold[green]%}%n@%m%{$reset_color%} %{$fg_bold[white]%}[%D{%a %H:%M:%S}]%{$reset_color%} %{$fg_bold[blue]%}%2~%{$reset_color%} [%?] $(my_$

RPS1="${return_code} "
RPS1="$RPS1 %{$fg_bold[grey]%}<%{$reset_color%}%{$fg_bold[blue]%}Java ${java_version}%{$reset_color%}%{$fg_bold[grey]%}>%{$reset_color%}"
RPS1="$RPS1 %{$fg_bold[yellow]%}${free_space}%{$reset_color%}"
RPS1="$RPS1 %{$fg_bold[grey]%}-[ End%{$reset_color%} %{$fg[green]%}%D{%Y-%m-%d %H:%M:%S}%{$reset_color%} %{$fg_bold[grey]%}]-%{$reset_color%}"

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[yellow]%}("
ZSH_THEME_GIT_PROMPT_SUFFIX=") %{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%%"
ZSH_THEME_GIT_PROMPT_ADDED="+"
ZSH_THEME_GIT_PROMPT_MODIFIED="*"
ZSH_THEME_GIT_PROMPT_RENAMED="~"
ZSH_THEME_GIT_PROMPT_DELETED="!"
ZSH_THEME_GIT_PROMPT_UNMERGED="?"

function x_call_date() {
  echo "${fg_bold[grey]}-[${reset_color} ${fg_bold[blue]}$(date "+%Y-%m-%d %H:%M:%S")${reset_color} ${fg_bold[grey]}Start ]-${reset_color}"
}

preexec_functions+=(x_call_date)
