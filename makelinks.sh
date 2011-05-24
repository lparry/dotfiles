#!/bin/sh
rm ~/.ackrc
rm ~/.gitconfig
rm ~/.gitignore
rm ~/.inputrc
rm ~/.irbrc
rm ~/.screenrc
rm ~/.vim
rm ~/.vimrc
rm ~/.zsh
rm ~/.zshrc
ln -s ~/dotfiles/ackrc     ~/.ackrc
ln -s ~/dotfiles/gitconfig ~/.gitconfig
ln -s ~/dotfiles/gitignore ~/.gitignore
ln -s ~/dotfiles/inputrc   ~/.inputrc
ln -s ~/dotfiles/irbrc     ~/.irbrc
ln -s ~/dotfiles/screenrc  ~/.screenrc
ln -s ~/dotfiles/vim       ~/.vim
ln -s ~/dotfiles/vimrc     ~/.vimrc
ln -s ~/dotfiles/zsh       ~/.zsh
ln -s ~/dotfiles/zshrc     ~/.zshrc
ln -s ~/oh-my-zsh          ~/.oh-my-zsh
