function git_status_if_git_dir() {
  git show 2> /dev/null 1> /dev/null
  if [ $? -eq 0 ]; then
    echo ""
    git status
    echo ""
  fi
}

function cd() {
  builtin cd "$@" && ls && git_status_if_git_dir
}

. ~/dotfiles/tools/z-zsh/z.sh
function precmd () {
  z --add "$(pwd -P)"
}

