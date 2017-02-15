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

function db-from-scratch()
{
  redis-cli flushall
  rake db:migrate:reset db:seed
}

function db-from-production()
{
  redis-cli flushall
  script/restore_prod_to_local_db.sh
  rake db:migrate db:seed
  curl -X DELETE http://localhost:9200/_all
  redis-cli flushall
}


function _keychain() {
  keychain="envato.keychain"
  service="elements-development"
  key=${1}
  security find-generic-password -a $service -s $key -w $keychain
}

function _keychain_hex() {
  _keychain $1 | perl -pe 's/([0-9a-f]{2})/chr hex $1/gie'
}

function elements-backend() {
  elements-environment bundle exec rails server -p 5000 -b 0.0.0.0
}

function s() {
  ack "$*"
}

function ackv() {
  ack $* -l|xargs vim
}

code () { VSCODE_CWD="$PWD" open -n -b "com.microsoft.VSCode" --args $* ;}

function elements-backend() {
  heroku $* --app elements-backend
}
