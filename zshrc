. ~/.zsh/rc.zsh

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# use gnu coreutils where available
if [ -d "$(brew --prefix coreutils)/libexec/gnubin" ]; then
  export PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"
fi

# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

# Set to the name theme to load.
# Look in ~/.oh-my-zsh/themes/
export ZSH_THEME="lucas"

# Set to this to use case-sensitive completion
# export CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# export DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# export DISABLE_LS_COLORS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git rails ruby osx)

export DISABLE_AUTO_UPDATE=true
source $ZSH/oh-my-zsh.sh

export RUBY_GC_MALLOC_LIMIT=64000000

# Customize to your needs...
source ~/Dropbox/dotfiles/git-repos/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

if [[ `hostname` == 'lucas-vm' ]]; then
  cd ~/dev/envato/tango_steps
fi

if [[ `hostname` == 'Lucas-i7-iMac.local' ]]; then
  fortune | cowsay | lolcat
fi


# ruby tuning
export RUBY_HEAP_MIN_SLOTS=1000000
export RUBY_HEAP_SLOTS_INCREMENT=1000000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
export RUBY_GC_MALLOC_LIMIT=1000000000
export RUBY_HEAP_FREE_MIN=500000

export PATH=./bin/:$PATH
