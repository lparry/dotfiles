setopt prompt_subst
setopt hist_ignore_dups
setopt autopushd               # automatically append dirs to the push/pop list
setopt nobeep                  # i hate beeps
#setopt printexitvalue          # alert me if something's failed
setopt correct                 # spelling correction

# setopt noautomenu              # don't cycle completions
# setopt autocd                  # change to dirs without cd
# setopt pushdignoredups         # and don't duplicate them
# setopt cdablevars              # avoid the need for an explicit $
# setopt nocheckjobs             # don't warn me about bg processes when exiting
# setopt nohup                   # and don't kill them, either
# setopt listpacked              # compact completion lists
# setopt listtypes               # show types in completion
# setopt extendedglob            # weird & wacky pattern matching - yay zsh!
# setopt completeinword          # not just at the end
# setopt alwaystoend             # when complete from middle, move cursor
# setopt nopromptcr              # don't add \r which overwrites cmd output with no \n
# setopt histverify              # when using ! cmds, confirm first
# setopt interactivecomments     # escape commands so i can use them later
# setopt recexact                # recognise exact, ambiguous matches


#fpath=($ZSH/functions $ZSH/completions $fpath)

# Load all of the config files in ~/oh-my-zsh that end in .zsh
# TIP: Add files you don't want in git to .gitignore
for config_file (~/.zsh/completion/*.zsh) source $config_file
fpath=(~/.zsh/completions $fpath)
. ~/.zsh/completion.zsh
## Completions
autoload -Uz compinit
autoload -U compinit
compinit -C

. ~/.zsh/aliases.zsh
. ~/.zsh/functions.zsh
. ~/.zsh/git_functions.zsh
. ~/.zsh/git_aliases.zsh
. ~/.zsh/prompt.zsh
. ~/.zsh/rbenv.zsh
. ~/.zsh/themes/lucas.zsh

export EDITOR='/usr/bin/vim'
export PATH="$HOME/bin:/usr/local/bin:/opt/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:/usr/X11/bin:/usr/local/mysql/bin:$PATH"

# safe binstubs on path
export PATH=".git/safe/../../bin:$PATH"


export MANPATH="/usr/local/share/man:/usr/X11/man:/usr/share/man"
export TERM=xterm-256color
export NUM_SWARM_DRONES=8

# Make ack ignore sql dumps, and search cucumber features.
export ACK_OPTIONS="--smart-case --nosql --type-set cucumber=.feature --type-set sass=.sass"

# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000
setopt extendedglob notify
unsetopt autocd
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
#zstyle :compinstall filename '/Users/lparry/.zshrc'

# End of lines added by compinstall

export WORDCHARS='*?_[]~=&;!#$%^(){}'

bindkey '[D' emacs-backward-word
bindkey '[C' emacs-forward-word

bindkey '^' self-insert-backslash
function self-insert-backslash() { LBUFFER+='\'; zle .self-insert }
zle -N self-insert-backslash


## case-insensitive (all),partial-word and then substring completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

#[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

# make rails migration and edit the file
function migration {
  migration_file=`script/generate migration $1 | tail -n1 | sed -e 's/create//' -e 's/ *//g'`
  mvim $migration_file
}

#REE Tweaks
export RUBY_HEAP_MIN_SLOTS=1000000
export RUBY_HEAP_SLOTS_INCREMENT=1000000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
export RUBY_GC_MALLOC_LIMIT=1000000000
export RUBY_HEAP_FREE_MIN=500

export NODE_PATH=$NODE_PATH:/usr/local/lib/node_modules

export local_development_domain=".dev"
