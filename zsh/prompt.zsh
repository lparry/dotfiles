autoload colors; colors;
grey='\e[0;90m'

#replaces /Users/NAME with ~, compacts dirnames down to 1 letter for parent directories
function short_pwd {
  trunc_pwd=$(pwd|sed -e "s:^/Users/$(whoami):~:" -e "s:^/home/$(whoami):~:" -e 's:\(\.\{0,1\}[^/]\)[^/]*/:\1/:g')
  echo "%{$fg[green]%}$trunc_pwd%{$reset_color%}"
}

function rubyversion_part {
  ruby_prompt="$(echo $RUBY_ROOT|sed -e "s/.*\///")"
  if [[ -z "$ruby_prompt" ]]; then
    ruby_prompt="system-ruby"
  fi
  echo "%{$fg[blue]%}$ruby_prompt%{$reset_color%}"
}

function branch_part {
  if [[ "$(current_branch)" != "" ]]; then
    echo "%{$grey%}#%{$fg[yellow]%}$(current_branch)%{$reset_color%}"
  fi
}

function host_part {
  echo "%{$grey%}@%{$fg[magenta]%}$(hostname -s)%{$reset_color%}"
}

function git_dirty_status {
  if [[ "$(git_dirty)" == "1" ]]; then
    echo "%{$fg[red]%}✗%{$reset_color%}"
  fi
}


function lucas_prompt {
  echo -n "$(short_pwd) %{$grey%}[%{$reset_color%}$(rubyversion_part)$(branch_part)$(host_part)%{$grey%}]%{$reset_color%}$(git_dirty_status)"
}

function set_tab_title {
  tabtitle `basename "$(pwd)"`
}

setopt prompt_subst

#this is causing problems on tab completion :(
PROMPT='%(?,%{$fg[green]%},%{$fg[red]%})⚡%{$fg[white]%} $(set_tab_title)'
#PROMPT='⚡ '
RPROMPT='$(lucas_prompt)'
