#!/bin/sh
rm ~/.ackrc
rm ~/.gemrc
rm ~/.gitconfig
rm ~/.gitignore
rm ~/.inputrc
rm ~/.irbrc
rm ~/.screenrc
rm ~/.zsh
rm ~/.zshrc
ln -s ~/Dropbox/dotfiles/ackrc     ~/.ackrc
ln -s ~/Dropbox/dotfiles/gemrc     ~/.gemrc
ln -s ~/Dropbox/dotfiles/gitconfig ~/.gitconfig
ln -s ~/Dropbox/dotfiles/gitignore ~/.gitignore
ln -s ~/Dropbox/dotfiles/inputrc   ~/.inputrc
ln -s ~/Dropbox/dotfiles/irbrc     ~/.irbrc
ln -s ~/Dropbox/dotfiles/screenrc  ~/.screenrc
ln -s ~/Dropbox/dotfiles/zsh       ~/.zsh
ln -s ~/Dropbox/dotfiles/zshrc     ~/.zshrc

ln -s ~/Dropbox/dotfiles/bin       ~/bin

git clone git://github.com/zsh-users/zsh-syntax-highlighting.git ~/Dropbox/dotfiles/git-repos/zsh-syntax-highlighting

