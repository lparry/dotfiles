# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000
setopt extendedglob notify
bindkey -e
# End of lines configured by zsh-newuser-install

setopt prompt_subst
setopt hist_ignore_dups
setopt autopushd               # automatically append dirs to the push/pop list
setopt nobeep                  # i hate beeps
#setopt printexitvalue          # alert me if something's failed
setopt correct                 # spelling correction

unsetopt autocd                  # change to dirs without cd
# setopt listpacked              # compact completion lists
# setopt listtypes               # show types in completion
# setopt extendedglob            # weird & wacky pattern matching - yay zsh!
# setopt nopromptcr              # don't add \r which overwrites cmd output with no \n
# setopt histverify              # when using ! cmds, confirm first
# setopt interactivecomments     # escape commands so i can use them later
# setopt recexact                # recognise exact, ambiguous matches

# iTerm2v3 integration
test -e ${HOME}/.iterm2_shell_integration.zsh && source ${HOME}/.iterm2_shell_integration.zsh

for config_file ($HOME/.zsh/plugins/**/*.zsh) source $config_file
source "$HOME/.zsh/aliases.zsh"
source "$HOME/.zsh/environment.zsh"
source "$HOME/.zsh/functions.zsh"
source "$HOME/.zsh/git_aliases.zsh"
source "$HOME/.zsh/prompt.zsh"
source "$HOME/.zsh/secrets.zsh"
source "$HOME/.zsh/completion.zsh"
source "$HOME/.zsh/rake-fast.zsh"


#bindkey '[D' emacs-backward-word
#bindkey '[C' emacs-forward-word

# bindkey '^' self-insert-backslash
# function self-insert-backslash() { LBUFFER+='\'; zle .self-insert }
# zle -N self-insert-backslash

source ~/Dropbox/dotfiles/git-repos/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

#echo 'set docker env: eval "$(docker-machine env dev)"'

ln -sf /usr/local/share/git-core/contrib/diff-highlight/diff-highlight ~/bin/diff-highlight

# use gnu coreutils where available
if (which brew > /dev/null) && [[ $? == 0 ]] && [ -d "$(brew --prefix coreutils)/libexec/gnubin" ]; then

    export PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"
fi
source ~/.zshenv


# RUBY
export DEFAULT_RUBY_VERSION="2.3.3"
source /usr/local/opt/chruby/share/chruby/chruby.sh
source ~/bin/chruby-auto.sh
chruby $DEFAULT_RUBY_VERSION

# node
export NVM_DIR=~/.nvm
source /usr/local/opt/nvm/nvm.sh --no-use 2> /dev/null
nvm use --delete-prefix v6.9.5
echo "Using yarn $(yarn --version)"

alias foreman=forego
alias vim=emacs

function npm() {
  echo "dont you mean yarn $*"
  echo "automatically running yarn $* in 10 seconds..."
  sleep 10
  yarn $*
}
