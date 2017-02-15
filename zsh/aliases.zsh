alias l='ls'
alias ls='ls -F --color=tty'
alias ll='ls -lh'
alias la='ls -a'
alias ack="ag -S --nogroup --ignore src/vendor"
alias irb='pry --simple-prompt'
alias be='bundle exec'

alias tree='tree -C'

alias m='cd ~/dev/travel-blog/'

alias :q='exit'

alias df='df -kh $argv'

alias du='du -k --max-depth=1 $argv'

alias ss='bin/unicorn_rails --config-file ~/.unicorn.rb'
alias cucumber='cucumber -r features'
alias rake="bundle exec rake"


if (which gsed > /dev/null) && [[ $? == 0 ]]; then
  alias sed=gsed
fi

alias hg='nocorrect hg'


alias r='rails'
alias spec='rspec'
alias rspec='bundle exec rspec'
alias rails='bundle exec rails'
alias rake='bundle exec rake'
alias foreman='bundle exec foreman'
alias rubocop='bundle exec rubocop'

alias cap_shell='cap shell ROLES=web_app'

if (which hub > /dev/null) && [[ $? == 0 ]]; then
  alias git=hub
fi

alias sc='script/console'

# strip formatting from the clipboard
alias pbclean='pbpaste | pbcopy'


alias store="cd ~/dev/elements/elements-storefront"
alias contrib="cd ~/dev/elements/elements-contributors"
alias back="cd ~/dev/elements/elements-backend"
alias ef="npm run dev"
alias eb="ee forego start"

alias fuck-off-npm-debug-log="find . -name 'npm-debug.log.*' -exec rm  {} \;"
alias db-storefront="pgcli elements_dev"
alias db-contributors="pgcli elements_contributors_dev"


alias sleepsafe='sudo pmset -a destroyfvkeyonstandby 1 hibernatemode 25'
alias sleepfast='sudo pmset -a hibernatemode 0'
alias sleepdefault='sudo pmset -a hibernatemode 3'
alias youtube='mpv --ontop'
