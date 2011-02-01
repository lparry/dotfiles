" Enable file type detection.
filetype plugin on
filetype indent on

" searching
set ignorecase
set smartcase
set hlsearch
set incsearch " highlight match while typing search pattern
set showmatch
set infercase " adjust case of match for keyword completion

" make backspace work properly
set backspace=indent,eol,start " allow backspacing over everything in insert mode

" backup files
set nobackup

" tabs
set expandtab " use spaces when <Tab> is inserted
set shiftwidth=2 " number of spaces to use for (auto)indent step
set softtabstop=2
set tabstop=2

set tags=./tags;

set hidden "allow buffers to be hidden without writing to disk

set wildmenu
set wildmode=list:longest,full " better filename completion

" mouse works everywhere
set mouse=a

" make command timeout shorter
set timeoutlen=500

"dont slow down because of stupidly long syntax shizzle
set synmaxcol=2048

set directory=~/tmp//

" auto correct/abbreviations
ab teh the

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
autocmd BufReadPost *
      \ if line("'\"") > 0 && line("'\"") <= line("$") |
      \   exe "normal g`\"" |
      \ endif

autocmd BufRead .bash_local set syntax=config
autocmd BufNewFile,BufRead *.zsh*  setfiletype zsh
autocmd BufWritePre * call TidyWhiteSpace()
