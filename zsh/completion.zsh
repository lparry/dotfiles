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

fpath=(~/.zsh/completions $fpath)

#autoload -Uz compinit
autoload -U compinit
compinit -C

compdef _git gco=git-checkout
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
