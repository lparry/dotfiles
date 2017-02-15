autoload colors; colors;
grey='\e[0;90m'

#replaces /Users/NAME with ~, compacts dirnames down to 1 letter for parent directories
function color_short_pwd {
  echo "$fg[green]$(short_pwd)$reset_color"
}

function short_pwd {
  trunc_pwd=$(pwd|sed -e "s:^/Users/$(whoami):~:" -e "s:^/home/$(whoami):~:" -e 's:\(\.\{1,3\}[^/]\)[^/]*/:\1/:g')
  echo "$trunc_pwd"
}

function color_rubyversion_part {
   echo "$fg[blue]$(rubyversion_part)$reset_color"
}
function rubyversion_part {
  ruby_prompt=$RUBY_VERSION
  if [[ -z "$ruby_prompt" ]]; then
    ruby_prompt="system-ruby"
  else
    ruby_prompt=$(echo $RUBY_ROOT|sed -e "s/.*\///")
  fi
  echo "$ruby_prompt"
}

function color_node_version_part {
   echo "$fg[yellow]$(node_version_part)$reset_color"
}
function node_version_part {
  echo "node-$(node -v|sed -e "s/v//")"
}

function branch_part {
  if [[ "$(current_branch)" != "" ]]; then
    echo "($fg[yellow]$(current_branch)$reset_color)"
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
  echo -n "$(color_short_pwd) %{$grey%}[%{$reset_color%}$(rubyversion_part)$(branch_part)$(host_part)%{$grey%}]%{$reset_color%}$(git_dirty_status)"
}

function set_tab_title {
  tabtitle `basename "$(pwd)"`
}

setopt prompt_subst

precmd() { echo ""; echo "$(color_short_pwd) $(branch_part)[$(color_rubyversion_part)/$(color_node_version_part)]" }
#prompt='%(?,%{$fg[green]%},%{$fg[red]%})⚡%{$fg[white]%} '
prompt='%(?,⚡,❌) '
#RPROMPT='$(lucas_prompt)'
RPROMPT='$(set_tab_title)
'
