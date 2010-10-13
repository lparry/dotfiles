alias l='ls'
alias ls='ls -G'
alias ll='ls -lh'
alias la='ls -a'
alias lal='ls -lah'

alias s='git status $argv; return 0'
alias d='gd $argv'
alias m='mate . $argv'

alias df='df -kh $argv'
alias du='du -k -d 1 $argv'
alias ho='git push heroku master $argv'
alias mr='mate Rakefile app config db features lib public script spec vendor/plugins $argv'
alias reload_webkit='osascript -e 'tell application "WebKit" to do JavaScript "window.location.reload()" in front document''
alias restart_rails_app='touch tmp/restart.txt; reload_webkit'
alias tigs='tig status $argv'


alias ss='unicorn_rails'
