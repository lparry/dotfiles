
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

if [ -f "$HOME/.git-completion" ] ; then
  source $HOME/.git-completion
fi

if [ -f "$HOME/.bash_local" ] ; then
	source $HOME/.bash_local
fi

