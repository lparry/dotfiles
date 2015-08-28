#!/bin/sh
ln -sTf ~/Dropbox/dotfiles/ackrc     ~/.ackrc
ln -sTf ~/Dropbox/dotfiles/gemrc     ~/.gemrc
ln -sTf ~/Dropbox/dotfiles/gitconfig ~/.gitconfig
ln -sTf ~/Dropbox/dotfiles/gitignore ~/.gitignore
ln -sTf ~/Dropbox/dotfiles/inputrc   ~/.inputrc
ln -sTf ~/Dropbox/dotfiles/irbrc     ~/.irbrc
ln -sTf ~/Dropbox/dotfiles/tmux.conf ~/.tmux.conf
ln -sTf ~/Dropbox/dotfiles/zshrc     ~/.zshrc

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

