set nocompatible

source ~/.vim/autoload/rspec.vim

" visual stuff
syntax on
set background=dark
colorscheme koehler
set nowrap
set number " line numbers
set ruler " show cursor line and column in the status line
set showmatch " briefly jump to matching bracket
set matchtime=10 " tenths of a second to show

" line and column makers
set cursorcolumn
set cursorline
hi cursorcolumn ctermbg=red

" Enable file type detection.
" Use the default filetype settings, so that mail gets 'tw' set to 72,
" 'cindent' is on in C files, etc.
" Also load indent files, to automatically do language-dependent indenting.
filetype plugin on
filetype indent on

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
autocmd BufReadPost *
      \ if line("'\"") > 0 && line("'\"") <= line("$") |
      \   exe "normal g`\"" |
      \ endif

" spelling stuff
setlocal spell spelllang=en_au
:map <F5> :setlocal spell! spelllang=en_au<cr>
:imap <F5> <ESC>:setlocal spell! spelllang=en_au<cr>

map <C-n> :cn
map <C-p> :cp

"ctrl + a/e to move to end/start of lines
:map <C-a> 0
:map <C-e> $
:cmap <C-a> <home>
:cmap <C-e> <end>
:imap <C-e> <ESC>$i<right>
:imap <C-a> <ESC>0i

"maximize windows
:map _ <c-w>_

" colon commands (must start with capital letters sadly)
command W write
command Q quit  " compensate for my sloppy typing
command WQ write | quit
command Wq write | quit
command QW write | quit

" auto correct/abbreviations
ab teh the

" highlight StatusLine cterm=none ctermbg=darkred

autocmd BufRead .bash_local set syntax=config

" stops vim jumping down multiple lines when in wrap mode
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
nnoremap <Down> gj
nnoremap <Up> gk
vnoremap <Down> gj
vnoremap <Up> gk
inoremap <Down> <C-o>gj
inoremap <Up> <C-o>gk

" helpful tab completion
" function! InsertTabWrapper(direction)
"     let col = col('.') - 1
"     if !col || getline('.')[col - 1] !~ '\k'
"         return "\<tab>"
"     elseif "backward" == a:direction
"         return "\<c-p>"
"     else
"         return "\<c-n>"
"     endif
" endfunction
"
" inoremap <tab> <c-r>=InsertTabWrapper("forward")<cr>
" inoremap <s-tab> <c-r>=InsertTabWrapper("backward")<cr>

function! TidyWhiteSpace()
  if search('\s\+$')
    :%s/\s\+$//
  endif
endfunction

" makes gf always open in a new pane
nnoremap gf <C-W>f

" searching
set ignorecase
set hlsearch
set incsearch " highlight match while typing search pattern
set infercase " adjust case of match for keyword completion

" make backspace work properly
set backspace=indent,eol,start " allow backspacing over everything in insert mode

" backup files
set backup " keep backup file after overwriting a file
set backupdir=~/tmp/vim " list of directories for the backup file

" Use Ack instead of grep

" tabs
set expandtab " use spaces when <Tab> is inserted
set shiftwidth=2 " number of spaces to use for (auto)indent step
set softtabstop=2
set tabstop=2


set tags=./tags;



let mapleader = ","

"find out who to blame for the current highlighted lines
vmap <Leader>b :<C-U>!git blame <C-R>=expand("%:p") <CR> \| sed -n <C-R>=line("'<") <CR>,<C-R>=line("'>") <CR>p <CR>
map <Leader>w :call TidyWhiteSpace()<CR>
map <Leader>s :!spec -f n <C-R>=SpecFileName() <CR> <CR>
map <Leader>j :vs <C-R>=SpecOrCodeToggle() <CR> <CR>


"set foldenable " set to display all folds open
"set history=500
"set diffopt=icase,iwhite,context:4,filler
"set showcmd " show (partial) command in status line
"set sidescrolloff=4 " min. nr. of columns to left andright of cursor

"autocmd VimEnter * NERDTree "open NERDTree when vim opens
"autocmd VimEnter * set nocursorcolumn "turn off the cursorcolumn in the nerdtree pane that is now selected
"autocmd VimEnter * wincmd p "change to the main pane
"
