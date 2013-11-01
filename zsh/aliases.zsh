alias l='ls'
alias ls='ls -GF --color=tty'
alias ll='ls -lh'
alias la='ls -a'
alias ack="ag -S --nogroup"

alias tree='tree -C'

alias m='cd ~/Dropbox/travel-blog/'

alias :q='exit'

alias df='df -kh $argv'

alias du='du -k --max-depth=1 $argv'

alias ss='bin/unicorn_rails --config-file ~/.unicorn.rb'
alias cucumber='cucumber -r features'


if (which gsed > /dev/null) && [[ $? == 0 ]]; then
  alias sed=gsed
fi

alias hg='nocorrect hg'
alias cap='nocorrect cap'
alias rspec='nocorrect rspec'
alias spec='nocorrect rspec'
alias r='rails'

alias cap_shell='cap shell ROLES=web_app'

if (which hub > /dev/null) && [[ $? == 0 ]]; then
  alias git=hub
fi

alias sc='script/console'
