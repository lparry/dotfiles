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
set backupskip=/tmp/*,/private/tmp/*"

" tabs
set expandtab " use spaces when <Tab> is inserted
set shiftwidth=2 " number of spaces to use for (auto)indent step
set softtabstop=2
set tabstop=2

set tags=./tags;

set hidden "allow buffers to be hidden without writing to disk

set wildmenu
set wildmode=list:longest,full " better filename completion

" use the osx clipboard
set clipboard=unnamed

" mouse works in insert mode
"if has("gui_running")
set mouse=a
