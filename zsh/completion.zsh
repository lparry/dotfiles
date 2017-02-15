setopt auto_menu         # show completion menu on succesive tab press
setopt complete_in_word
setopt always_to_end


# use /etc/hosts and known_hosts for hostname completion
[ -r /etc/ssh/ssh_known_hosts ] && _global_ssh_hosts=(${${${${(f)"$(</etc/ssh/ssh_known_hosts)"}:#[\|]*}%%\ *}%%,*}) || _ssh_hosts=()
[ -r ~/.ssh/known_hosts ] && _ssh_hosts=(${${${${(f)"$(<$HOME/.ssh/known_hosts)"}:#[\|]*}%%\ *}%%,*}) || _ssh_hosts=()
[ -r /etc/hosts ] && : ${(A)_etc_hosts:=${(s: :)${(ps:\t:)${${(f)~~"$(</etc/hosts)"}%%\#*}##[:blank:]#[^[:blank:]]#}}} || _etc_hosts=()
hosts=(
  "$_global_ssh_hosts[@]"
  "$_ssh_hosts[@]"
  "$_etc_hosts[@]"
  "$HOST"
  localhost
)
zstyle ':completion:*:hosts' hosts $hosts


# Use caching so that commands like apt and dpkg complete are useable
zstyle ':completion::complete:*' use-cache 1
zstyle ':completion::complete:*' cache-path /tmp/

## case-insensitive (all),partial-word and then substring completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

fpath=(~/.zsh/completion $fpath)

autoload -Uz compinit
compinit -u

# if these break `brew uninstall --force git && brew install git --without-completions`
compdef _git gco_fancy=git-checkout
compdef _git gm=git-merge
compdef _git g=git-status
compdef _git ga=git-add
compdef _git gbr=git-branch
compdef _git gc=git-commit
compdef _git gca=git-commit
compdef _git gd=git-diff
compdef _git gf=git-fetch
compdef _git glp=git-log
compdef _git gl2=git-log
compdef _git gl=git-log
compdef _git glc=git-log
compdef _git glcg=git-log
compdef hub=git

# hub tab-completion script for zsh.
# This script complements the completion script that ships with git.
#
# vim: ft=zsh sw=2 ts=2 et

# Autoload _git completion functions
# if declare -f _git > /dev/null; then
#   _git
# fi

if declare -f _git_commands > /dev/null; then
  _hub_commands=(
    'alias:show shell instructions for wrapping git'
    'pull-request:open a pull request on GitHub'
    'fork:fork origin repo on GitHub'
    'create:create new repo on GitHub for the current project'
    'browse:browse the project on GitHub'
    'compare:open GitHub compare view'
  )
  # Extend the '_git_commands' function with hub commands
  eval "$(declare -f _git_commands | sed -e 's/base_commands=(/base_commands=(${_hub_commands} /')"
fi


# Make up arrow search backwards in history
bindkey "^[[A" history-search-backward
bindkey "^[[B" history-search-forward
