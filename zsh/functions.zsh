function git_status_if_git_dir() {
  git show 2> /dev/null 1> /dev/null
  if [ $? -eq 0 ]; then
    echo ""
    git status
    echo ""
  fi
}

function freshen_ctags {
  /usr/local/bin/ctags -R app/* config/* lib/*
}

# make rails migration and edit the file
function migration {
  migration_file=`script/generate migration $1 | tail -n1 | sed -e 's/create//' -e 's/ *//g'`
  mvim $migration_file
}

function cd() {
  builtin cd "$@" && (echo ""; git_status_if_git_dir;ls)
  chruby_auto
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

function git-branch-for-prompt() {
  git_branch=$((git branch 2> /dev/null) | grep \* | cut -c3-)
  if ! [[ -z "$git_branch" ]];then
    echo "$git_branch"
  fi
}

function rule () {
  printf "%$(tput cols)s\n"|tr " " "─"
}

function strip_diff_leading_symbols(){
 color_code_regex="(\x1B\[([0-9]{1,2}(;[0-9]{1,2})?)?[m|K])"

 # simplify the unified patch diff header
 sed -r "s/^($color_code_regex)diff --git .*$//g" | \
   sed -r "s/^($color_code_regex)index .*$/\n\1$(rule)/g" | \
   sed -r "s/^($color_code_regex)\+\+\+(.*)$/\1+++\5\n\1$(rule)\x1B\[m/g" |\

 # actually strips the leading symbols
   sed -r "s/^($color_code_regex)[\+\-]/\1 /g"
}

function kill_spring(){
  ps aux|grep spring|awk '{ print $2 }'|xargs kill
}

# zsh: Place this in .zshrc after "source /Users/georgen/.iterm2_shell_integration.zsh".
iterm2_print_user_vars() {
  iterm2_set_user_var gitBranch $(git-branch-for-prompt)
  iterm2_set_user_var rubyVersion $(rubyversion_part)
  iterm2_set_user_var shortPwd $(short_pwd)
}

function elements-backend() {
  command cd /Users/lparry/dev/elements/elements-backend &&
  $(aws-keys env elements-staging) && \
    CLOUDINARY_CLOUD_NAME='envato-elements-staging' \
    CLOUDINARY_API_KEY=$(security find-generic-password -a cloudinary -s cloudinary_api_key -w  envato.keychain) \
    CLOUDINARY_API_SECRET=$(security find-generic-password -a cloudinary -s cloudinary_api_secret -w  envato.keychain) \
    bundle exec rails server -p 5000
}

function db-from-scratch()
{
  rake db:migrate:reset
  rake db:seed
}

code () { VSCODE_CWD="$PWD" open -n -b "com.microsoft.VSCode" --args $* ;}
