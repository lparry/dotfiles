
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
alias g='grep'
alias cp='cp -v'
alias df='df -H'
alias du='du -H'
alias rm='rm -i'
alias vi='vim'
alias top="top -L"
alias gitc="git commit -av"

export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad
export TERM=xterm-color
export EDITOR=vim

#add ssh known hosts to auto completion
complete -W "$(echo `cat ~/.ssh/known_hosts | cut -f 1 -d ' ' | sed -e s/,.*//g | uniq | grep -v "\["`;)" ssh

alias rake_autocompletion='complete -W "$(echo `rake -T| cut -f 2 -d " "|uniq`;)" rake'

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


if [ -f "$HOME/.git-completion" ] ; then
  source $HOME/.git-completion
fi

if [ -f "$HOME/.bash_local" ] ; then
	source $HOME/.bash_local
fi

