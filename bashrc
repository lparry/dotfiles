# .bashrc

# User specific aliases and functions

# Source global definitions
if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi
if [ -n "$PS1" ]; then 
  PS1='\[\e[0;32m\]\u@\h \[\e[0;33m\]\w \[\e[0;00m\]$(__git_ps1 "(%s)")\n\[\e[0;39m\]\$ '; 
fi
