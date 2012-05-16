export git_concise_log_format='--pretty=format:%Cblue%h%d%Creset %cr %Cgreen%an%Creset %s'

function gco {
  git checkout $argv  && freshen_ctags.sh
}

function git_merge_and_amend {
  command git merge --no-ff $argv[1] && git commit --amend
}

function current_remote {
  echo ${${$(git config remote.origin.url)#*github.com[/:]}%.*}
}

function github_link {
  echo https://github.com/`current_remote`/tree/`current_branch`
}

alias gm='git_merge_and_amend'
alias gf='git fetch'
alias gfo='git fetch origin && git fetch origin --tags'
alias glp='git log -p --color-words -w'
alias gup='git smart-pull && freshen_ctags.sh'
alias gbr='git branch -v'
alias gc='git commit -v'
alias gca='gc -a'
alias g='git status -sb'
alias ga='git add'
alias grba='git rebase --abort'
alias grbc='git rebase --continue'
alias gch='git cherry-pick'
alias gd='git diff -M'
#alias gd='git diff -M --color-words="."'
alias gl='git log --graph --pretty=format:"%Cblue%h%d%Creset %ar %Cgreen%an%Creset %s%Creset"'
alias gpo='git push origin && github_link'
alias grho='git reset --hard origin/`current_branch`'
alias gst='git stash'
alias gstp='git stash pop'

alias git-ignore-changes='git update-index --assume-unchanged $argv'
alias git-unignore-changes='git update-index --no-assume-unchanged $argv'
