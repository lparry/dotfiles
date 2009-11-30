
if [ -f "$HOME/.bashrc" ] ; then
	source $HOME/.bashrc
fi

if [ -d "$HOME/bin" ] ; then
  export PATH=$PATH:$HOME/bin
fi

alias ls='ls -FG'
alias ll='ls -FGl'
alias la='ls -aFGl'
alias h='history'
alias hg='history|grep'
#alias g='grep'
alias cp='cp -v'
alias df='df -H'
alias du='du -H'
alias ep='vim ~/.bash_profile; . ~/.bash_profile'
alias rm='rm -i'
alias vi='vim'

#git
alias gc="git commit -av"
alias g="git status"
alias gd="git diff"
alias gpush="git push"
alias gp="git pull"

alias mma='cd ~/dev/marketplace && mate app config db features spec compass Rakefile README Capfile lib vendor/plugins stories'

export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad
export TERM=xterm-color
export EDITOR=vim
export IRBRC="/Users/lparry/.irbrc"

#add ssh known hosts to auto completion
complete -W "$(echo `cat ~/.ssh/known_hosts | cut -f 1 -d ' ' | sed -e s/,.*//g | uniq | grep -v "\["`;)" ssh

#rake autocompletion function - run in the directory containing your rakefile
function rake_autocompletion {
  completion_path="$HOME/.completion-cache`pwd`"
  rake_cache_file="$completion_path/rake_completion"

  if [ -f $rake_cache_file ]; then
    rake_options=`cat $rake_cache_file`
  else
    rake_options="$(echo `rake -T| sed s/\(in[^\)]*\)//| cut -f 2 -d ' '|uniq`;)"
    mkdir -p $completion_path
    echo $rake_options > "$rake_cache_file"
  fi

  complete -o bashdefault -o default -o nospace -W "$rake_options" rake
  COMP_WORDBREAKS=${COMP_WORDBREAKS//:}
}

#capistrano autocompletion function - run in the directory containing your capfiles
function cap_autocompletion {
  completion_path="$HOME/.completion-cache`pwd`"
  cap_cache_file="$completion_path/cap_completion"

  if [ -f $cap_cache_file ]; then
    cap_options=`cat $cap_cache_file`
  else
    cap_options="$(echo `cap -T|sed 's/Some tasks were not listed.*//;s/or because they are only.*//;s/tasks, type.*//;s/Extended help may be.*//;s/Type \`cap -e taskname.*//'| cut -f 2 -d ' '|uniq`;)"
    mkdir -p $completion_path
    echo $cap_options > "$cap_cache_file"
  fi
  complete -o bashdefault -o default -o nospace -W "$cap_options" cap
  COMP_WORDBREAKS=${COMP_WORDBREAKS//:}
}

function clear_completion_caches {
  rm -rf "$home/.completion_cache" 
  #trigger regeneration if in a rails app 
  cd . 
}


cd () {
  command cd "$@";
  command ls
  # Add enhanced completion for a folder containing a rails app 
  if [ -f ./Rakefile ]; then
    rake_autocompletion 
  fi
  if [ -f ./Capfile ]; then
    cap_autocompletion 
  fi
}


# function for git branch in prompt
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

function proml {
  local BLUE="\[\033[0;34m\]"
  local RED="\[\033[0;31m\]"
  local LIGHT_RED="\[\033[1;31m\]"
  local GREEN="\[\033[0;32m\]"
  local YELLOW="\[\033[0;33m\]"
  local LIGHT_GREEN="\[\033[1;32m\]"
  local WHITE="\[\033[0;39m\]"
  local LIGHT_GRAY="\[\033[0;37m\]"
  local BLINK_GREEN="\[\033[5;32m\]"
 
  PS1="$GREEN\h $YELLOW\w$WHITE \$(parse_git_branch)\n\$ $WHITE"
}
proml


if [ -f "$HOME/dotfiles/git-completion" ] ; then
  source $HOME/dotfiles/git-completion
fi

if [ -f "$HOME/.bash_local" ] ; then
	source $HOME/.bash_local
fi

