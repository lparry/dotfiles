" :r!command == past output of command at current position
" :RMigration migration name == open a migration without worrying about the hash
" konqterm == shell within vim
"
set nocompatible

set shell=/bin/bash

" Pathogen this shit UP!
filetype off
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()
filetype plugin indent on

" load some plugins manually
runtime macros/matchit.vim " better pair matching for %
"source ~/.vim/bundle/lucas-rspec/autoload/rspec.vim

" load up all my config shizzle
source ~/.vim/functions.vim
source ~/.vim/shortcuts.vim
source ~/.vim/appearance.vim
source ~/.vim/preferences.vim
