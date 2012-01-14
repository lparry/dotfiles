" :r!command == past output of command at current position
" :RMigration migration name == open a migration without worrying about the hash
" konqterm == shell within vim
"
set nocompatible
filetype off
set shell=/bin/bash
set guifont=Menlo\ Regular\ for\ Powerline:h14

" vundle bundles!
source ~/.vim/vundle.vim


" load some plugins manually
runtime macros/matchit.vim " better pair matching for %
"source ~/.vim/bundle/lucas-rspec/autoload/rspec.vim

" load up all my config shizzle
source ~/.vim/functions.vim
source ~/.vim/shortcuts.vim
source ~/.vim/preferences.vim
source ~/.vim/appearance.vim
