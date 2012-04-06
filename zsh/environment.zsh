export WORDCHARS='*?_[]~=&;!#$%^(){}'

export EDITOR='/usr/bin/vim'
export PATH="$HOME/bin:/usr/local/bin:/opt/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:/usr/X11/bin:/usr/local/mysql/bin:$PATH"

# safe binstubs on path
export PATH=".git/safe/../../bin:$PATH"


export MANPATH="/usr/local/share/man:/usr/X11/man:/usr/share/man"
export TERM=xterm-256color
export NUM_SWARM_DRONES=8

# Make ack ignore sql dumps, and search cucumber features.
export ACK_OPTIONS="--smart-case --nosql --type-set cucumber=.feature --type-set sass=.sass"

#REE Tweaks
export RUBY_HEAP_MIN_SLOTS=1000000
export RUBY_HEAP_SLOTS_INCREMENT=1000000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
export RUBY_GC_MALLOC_LIMIT=1000000000
export RUBY_HEAP_FREE_MIN=500


export local_development_domain=".dev"


# use gnu coreutils where available
if [ -d "$(brew --prefix coreutils)/libexec/gnubin" ]; then
  export PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"
fi
export PATH=~/Dropbox/dotfiles/bin:$PATH
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='1;32'
# ruby tuning
export RUBY_HEAP_MIN_SLOTS=1000000
export RUBY_HEAP_SLOTS_INCREMENT=1000000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
#export RUBY_GC_MALLOC_LIMIT=64000000
export RUBY_GC_MALLOC_LIMIT=1000000000
export RUBY_HEAP_FREE_MIN=500000

#export PATH=./bin/:$PATH
export BUNDLE_PATH=vendor/bundle-$(hostname)

export PATH="$HOME/.rbenv/bin:$PATH"
