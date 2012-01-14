alias l='ls'
alias ls='ls -G'
alias ll='ls -lh'
alias la='ls -a'
alias lal='ls -lah'

alias s='git status $argv; return 0'
alias d='gd $argv'
alias m='cd ~/dev/envato/marketplace'

alias :q='exit'

alias df='df -kh $argv'
if [[ '$(uname)' == 'Linux' ]]; then
  alias du='du -k --max-depth=1 $argv'
else
  alias du='du -k -d 1 $argv'
fi
alias ho='git push heroku master $argv'
alias reload_webkit='osascript -e 'tell application "WebKit" to do JavaScript "window.location.reload()" in front document''
alias restart_rails_app='touch tmp/restart.txt; reload_webkit'
alias tigs='tig status $argv'

alias ss='unicorn_rails --config-file ~/.unicorn.rb'

#alias grep='echo "use ack"'

alias cucumber='cucumber -r features'

alias hg='nocorrect hg'

alias spec='bundle_when_gemfile_exists spec'
alias rake='bundle_when_gemfile_exists rake'
alias cap='bundle_when_gemfile_exists cap'
alias cap_shell='cap shell ROLES=web_app'
alias b='bundle exec'
alias c='bundle exec cucumber'
alias s='bundle exec spec'
