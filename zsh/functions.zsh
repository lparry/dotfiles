function git_status_if_git_dir() {
  git show 2> /dev/null 1> /dev/null
  if [ $? -eq 0 ]; then
    echo ""
    git status
    echo ""
  fi
}

# make rails migration and edit the file
function migration {
  migration_file=`script/generate migration $1 | tail -n1 | sed -e 's/create//' -e 's/ *//g'`
  mvim $migration_file
}

function cd() {
  builtin cd "$@" && ls && git_status_if_git_dir
}

function git-branch-owners() {
  git branch $@ |grep -v 'HEAD' | sed -e 's/  \(.*\)/echo `git show --pretty=format:"%an" "\1" |head -n1` - \1 /'|sh
}

function bundle_when_gemfile_exists() {
#  if [ -f Gemfile ] ; then
#    bundle exec $*
#  else
    $*
#  fi
}

# cause the way ssh-agent works is kind of shit tbh
function ssh-agent() {
  eval `command ssh-agent`
  ssh-add
}

tabtitle () { echo -ne "\033]0;$@\\007"; }

