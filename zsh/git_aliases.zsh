
# function gco {
#   git checkout $argv  && freshen_ctags
# }

function git_merge_and_amend {
  command git merge --no-ff $argv[1] && git commit --amend
}

function current_remote {
  echo ${${$(git config remote.origin.url)#*github.com[/:]}%.*}
}

function github_link {
  echo https://github.com/`current_remote`/compare/`current_branch`
}

function gco_fancy {
  if [ "$1" == "-b" ]; then
    branch_string=$(echo "$*"|sed -e "s/^-b\s*//" -e "s/\s*$//" -e "s/[^a-zA-Z0-9]\+/-/g"|tr '[:upper:]' '[:lower:]')
    git checkout -b "lparry/$branch_string"

  else
    git checkout $* || git checkout "lparry/$*"
  fi
}

 function glp_fancy {
  if [[ $1 ]]; then
    git log --follow -p --color-words -w $*
  else
    git log -p --color-words -w $*
  fi
}

function git-checkout-menu() {
  OPS3=$PS3
  echo There are multiple branchs in this repo. Please select the one you want to use
  PS3="If you're not sure just choose \"master\" "
  select br in $(git branch|sed -e '/^[* ] /s///'|sort); do
      [[ -n $br ]] && git checkout $br &&
          break
  done
  PS3=$OPS3
}

#alias gco='git checkout'
alias git-cleanup-local-branches="gbr -l --merged|grep -v ' master '|awk '{print \$1}'|xargs git branch -d"
alias git-cleanup-remote-branches="gbr --remotes --merged origin/master|grep origin|grep -v 'origin/HEAD'|grep -v 'origin/master'|sed -e 's/origin\//:/'|awk '{ print $1}'|xargs git push origin"
#alias br='gco -b'
alias gm='git merge --no-ff'
alias gf='git fetch'
alias gco=gco_fancy
alias gcom=git-checkout-menu
alias glp=glp_fancy
alias gfo='git fetch origin && git fetch origin --tags'
alias gup='git smart-pull' # && freshen_ctags'
alias gbr='git branch -v'
alias gc='git commit -v'
alias gca='gc -a'
alias g='git status -sb'
alias ga='git add --all'
alias grba='git rebase --abort'
alias grbc='git rebase --continue'
alias gch='git cherry-pick'
alias gd='git diff -M'
#alias gd='git diff -M --color-words="."'
alias gl='git log --graph --pretty=format:"%Cblue%h%d%Creset %ar %Cgreen%an%Creset %s%Creset"'
alias gpo='git push origin && github_link'
alias gpo='git push origin && ( [ "master" = "$(current_branch)" ] || echo -e "\nOpen a PR: $(github_link)?expand=1\n")'
alias grho='git reset --hard origin/`current_branch`'
alias gst='git stash'
alias gstp='git stash pop'

alias git-ignore-changes='git update-index --assume-unchanged $argv'
alias git-unignore-changes='git update-index --no-assume-unchanged $argv'
