export WORDCHARS='*?_[]~=&;!#$%^(){}'

if [ -f "/usr/local/bin/vim" ]; then
  export EDITOR='/usr/local/bin/vim'
elif [ -f "/usr/bin/vim" ]; then
  export EDITOR='/usr/bin/vim'
fi

#export MANPATH="/usr/local/share/man:/usr/X11/man:/usr/share/man"

export TERM=xterm-256color

export NUM_SWARM_DRONES=8

export local_development_domain=".dev"

# Make ack ignore sql dumps, and search cucumber features.
export ACK_OPTIONS="--smart-case --nosql --type-set cucumber=.feature --type-set sass=.sass"

# grep stuff
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='1;32'

# ruby tuning
export RUBY_HEAP_MIN_SLOTS=1000000
export RUBY_HEAP_SLOTS_INCREMENT=1000000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
export RUBY_GC_MALLOC_LIMIT=1000000000
#export RUBY_GC_MALLOC_LIMIT=64000000
export RUBY_HEAP_FREE_MIN=500000
#export RUBY_HEAP_FREE_MIN=500

# unique bundle_path for each host
export BUNDLE_PATH=vendor/bundle-$(hostname -s)

# Prefer /usr/local/
export PATH="/usr/local/bin:$PATH"

# use gnu coreutils where available
if (which brew > /dev/null) && [[ $? == 0 ]] && [ -d "$(brew --prefix coreutils)/libexec/gnubin" ]; then
  export PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"
fi

export PATH="$HOME/bin:$HOME/Dropbox/dotfiles/bin:/usr/local/sbin:$PATH"

# defined safe binstubs on path
export PATH=".git/safe/../../bin:$PATH"
