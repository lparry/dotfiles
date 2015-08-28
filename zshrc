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

source /usr/local/opt/chruby/share/chruby/chruby.sh
source /usr/local/opt/chruby/share/chruby/auto.sh
chruby ruby-2.1.2


for config_file ($HOME/.zsh/plugins/*.zsh) source $config_file
for config_file ($HOME/.zsh/*.zsh) source $config_file


#bindkey '[D' emacs-backward-word
#bindkey '[C' emacs-forward-word

# bindkey '^' self-insert-backslash
# function self-insert-backslash() { LBUFFER+='\'; zle .self-insert }
# zle -N self-insert-backslash

source ~/Dropbox/dotfiles/git-repos/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

echo 'set docker env: eval "$(docker-machine env dev)"'
