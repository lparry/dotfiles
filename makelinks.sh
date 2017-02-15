#!/bin/sh
ln -sf ~/Dropbox/dotfiles/ackrc     ~/.ackrc
ln -sf ~/Dropbox/dotfiles/gemrc     ~/.gemrc
ln -sf ~/Dropbox/dotfiles/gitconfig ~/.gitconfig
ln -sf ~/Dropbox/dotfiles/gitignore ~/.gitignore
ln -sf ~/Dropbox/dotfiles/inputrc   ~/.inputrc
ln -sf ~/Dropbox/dotfiles/irbrc     ~/.irbrc
ln -sf ~/Dropbox/dotfiles/tmux.conf ~/.tmux.conf
ln -sf ~/Dropbox/dotfiles/zshrc     ~/.zshrc
ln -sf ~/Dropbox/dotfiles/spacemacs ~/.spacemacs

# directories
rm -rf                             ~/.zsh
ln -s ~/Dropbox/dotfiles/zsh       ~/.zsh
rm -rf                             ~/.bundle
ln -s ~/Dropbox/dotfiles/bundle    ~/.bundle
rm -rf                             ~/.js
ln -s ~/Dropbox/dotfiles/dotjs     ~/.js
rm -rf                             ~/bin
ln -s ~/Dropbox/dotfiles/bin       ~/bin


if [ ! -d ~/Dropbox/dotfiles/git-repos/zsh-syntax-highlighting ]; then
  git clone git://github.com/zsh-users/zsh-syntax-highlighting.git ~/Dropbox/dotfiles/git-repos/zsh-syntax-highlighting
fi

if [ ! -d ~/Dropbox/vimfiles ]; then
  git clone http://lparry@github.com/lparry/vimfiles.git ~/Dropbox/vimfiles
fi

chflags nohidden ~/Library
