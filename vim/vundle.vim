set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

 " My Bundles here:
 "
 " original repos on github
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-ragtag'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-cucumber'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-markdown'
Bundle 'altercation/vim-colors-solarized'
Bundle 'godlygeek/tabular'
Bundle 'Lokaltog/vim-powerline'
Bundle "mileszs/ack.vim"
Bundle "sjl/gundo.vim"
Bundle "shemerey/vim-peepopen"


"needs auditing, wtf are these?
Bundle "tpope/vim-repeat"
Bundle "notahat/vim-reruby"
Bundle "vim-ruby/vim-ruby"
Bundle "bronson/vim-ruby-block-conv"
Bundle 'Raimondi/VimRegEx.vim'
Bundle 'nanotech/jellybeans.vim'
Bundle 'sjbach/lusty'
Bundle 'scrooloose/nerdtree'
Bundle 'kchmck/vim-coffee-script'
Bundle 'bogado/file-line'
Bundle 'tpope/vim-pathogen'
Bundle 'nelstrom/vim-textobj-rubyblock'
Bundle 'kana/vim-textobj-user'

 " vim-scripts repos
Bundle 'tComment'
Bundle 'L9'
Bundle 'SuperTab-continued.'
Bundle 'Rainbow-Parenthesis'
Bundle 'Align'
Bundle 'AutoComplPop'
 "Bundle 'FuzzyFinder'
 " non github repos
 "Bundle 'git://git.wincent.com/command-t.git'
filetype plugin indent on     " required!
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..
