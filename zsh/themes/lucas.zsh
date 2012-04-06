autoload colors; colors;
grey='\e[0;90m'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$grey%}[%{$fg[yellow]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$grey%}] %{$fg[red]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$grey%}]%{$reset_color%}"

function lucas_prompt {

  #replaces /Users/NAME with ~, compacts dirnames down to 1 letter for parent directories
  short_pwd=$(pwd|sed -e "s:^/Users/$(whoami):~:" -e "s:^/home/$(whoami):~:" -e 's:\(\.\{0,1\}[^/]\)[^/]*/:\1/:g')
  branch=$(current_branch)

  prompt="%{$fg[green]%}$short_pwd %{$fg[red]%}%{$reset_color%} $(git_prompt_info) "

  echo -n $prompt
}

setopt prompt_subst

#this is causing problems on tab completion :(
PROMPT='%(?,%{$fg[green]%},%{$fg[red]%})⚡%{$fg[white]%} '
#PROMPT='⚡ '
RPROMPT='$(lucas_prompt)'
