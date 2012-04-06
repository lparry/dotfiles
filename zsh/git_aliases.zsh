export git_concise_log_format='--pretty=format:%Cblue%h%d%Creset %cr %Cgreen%an%Creset %s'

function gco {
  git checkout $argv  && freshen_ctags.sh
}

function grbo {
  if [[ $(git status -s -uno) == '' ]] then
    clean=1
  else
    clean=0
  fi

  if [[ $clean == 0 ]] then
    git stash
  fi
  command git rebase --preserve-merges origin/`current_branch`
  if [[ $clean == 0 ]] then
    git stash pop
  fi
}

# Will return the current branch name
# Usage example: git pull origin $(current_branch)
#
function current_branch() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo ${ref#refs/heads/}
}


function gcob {
  command git checkout -pb $argv[1] --track origin/$argv[1]
}

function git_merge_and_ammend {
  command git merge --no-ff $argv[1] && git commit --amend
}

function github_link {
  echo https://github.com/envato/marketplace/tree/`current_branch`
}

alias gm='git_merge_and_ammend'

alias gbr-merged-branches='gfo --prune && gfo && gco master && grbo && gbr -a --merged'
alias grb-no-merges='command git rebase origin/`current_branch`'
alias gup='git smart-pull && freshen_ctags.sh'
alias grba='command git rebase --abort'
alias grbc='command git rebase --continue'
alias gfrpo='gfo && gst && grbo && gpo && gstp'
alias g='git status -sb'
alias ga='git add'
alias gab='gm $argv && gbr -d $argv'
alias gap='ga -p'
alias gau='git add -u'
alias gbr='git branch -v'
alias gc='git commit -v'
alias gca='gc -a'
alias gcam='gca --amend'
alias gcf='git config -l'
alias gch='git cherry-pick'
alias gcm='gc --amend'
alias gcop='gco -p'
alias gd='git diff -M'
#alias gd='git diff -M --color-words="."'
alias gdc='git diff --cached -M'
alias gdc='git diff --cached -M --color-words="."'
alias gdcw='git diff --cached $color_ruby_words'
alias gds='gitd --stat'
alias gdw='git diff $color_ruby_words'
alias gf='git fetch'
alias gfo='git fetch origin && git fetch origin --tags'
alias glp='git log -p --color-words -w'
alias gl2='git log --pretty=format:"%h %ad | %s%d [%an]" --graph --date=short --all'
alias gl='git log --graph --pretty=format:"%Cblue%h%d%Creset %ar %Cgreen%an%Creset %s%Creset"'
alias glc='git log $git_concise_log_format'
alias glcg='glc --graph'
alias gmd='gm $argv && gbr -d $argv $argv && glcg'
alias gp='git push'
alias gpb='git push banana'
alias gpd='gp deploy deploy'
alias gpo='git push origin && github_link'
alias gpom='git push origin master'
alias gpt='gp --tags'
alias gr='git reset'
alias graf='git remote add $argv[1] $argv[2] && gf $argv[1]'
alias grbc='command git rebase --continue'
alias grbi='grb -i'
alias grh='git reset --hard'
alias grho='git reset --hard origin/`current_branch`'
alias grl='git reflog'
alias grp='gr --patch'
alias grs='git reset --soft'
alias grsh='git reset --soft HEAD~'
alias grv='git remote -v'
alias gs='git show'
alias gss='gs --stat'
alias gst='git stash'
alias gstp='git stash pop'
alias gstwc='gst save --keep-index'
alias git-ignore-changes='git update-index --assume-unchanged $argv'
alias git-unignore-changes='git update-index --no-assume-unchanged $argv'
alias git-commits-since-production='git log --pretty=raw --stat production_deployed..HEAD'
