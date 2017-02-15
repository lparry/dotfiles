export WORDCHARS='*?_[]~=&;!#$%^(){}'

if [ -f "/usr/local/bin/nvim" ]; then
  export EDITOR=/usr/local/bin/nvim
elif [ -f "/usr/local/bin/vim" ]; then
  export EDITOR='/usr/local/bin/vim'
elif [ -f "/usr/bin/vim" ]; then
  export EDITOR='/usr/bin/vim'
fi

export TERM=xterm-256color

export local_development_domain=".dev"

# Make ack ignore sql dumps, and search cucumber features.
export ACK_OPTIONS="--smart-case --nosql --type-set cucumber=.feature --type-set sass=.sass"

# grep stuff
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='1;32'

# parallel bundle install
BUNDLE_JOBS=4




autoload -U zmv
alias mmv='noglob zmv -W'
export BETTER_ERRORS_EDITOR="macvim"

#bundle faster
export BUNDLE_JOBS=4



# export DOCKER_TLS_VERIFY="1"
# export DOCKER_HOST="tcp://192.168.152.129:2376"
# export DOCKER_CERT_PATH="/Users/lparry/.docker/machine/machines/docker-fusion"
# export DOCKER_MACHINE_NAME="docker-fusion"

export USE_CHRUBY=1

# Elements node tests
#export PHANTOMJS_BIN=/usr/local/bin/phantomjs
# export PREFERRED_KARMA_BROWSER="Firefox"

unalias run-help
autoload run-help
export HELPDIR=/usr/local/share/zsh/helpfiles

export DEV_MODE_SIGNIN="true"
export DONT_BUG_ME="true"
#export NIGHTWATCH_BROWSER="firefox"
export EAGER_LOAD_RAILS="true"

export ELASTICSEARCH_TEST_PORT=9200
export DONT_START_ELASTICSEARCH=true

export SSO_WEB_PORT=6601
export SSO_MAILCATCHER_PORT=9999
