" :r!command == past output of command at current position
" :RMigration migration name == open a migration without worrying about the hash
" konqterm == shell within vim
"
set nocompatible

"apparently these two lines make vim use normal regex, sadly i know a mangle
"of vim and perl regex so it's gonna hurt for a bit
nnoremap / /\v
vnoremap / /\v


"256 color terminal support (ie. iTerm.app on osx)
set t_Co=256

set shell=/bin/bash

" Pathogen this shit UP!
filetype off
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()
filetype plugin indent on


source ~/.vim/bundle/lucas-rspec/autoload/rspec.vim

set guifont=Inconsolata:h18

" visual stuff
syntax on
colorscheme dual

if has("gui_running")
  set background=light
else
  set background=dark
endif

set wrap
set number " line numbers
set ruler " show cursor line and column in the status line
set showmatch " briefly jump to matching bracket
set matchtime=10 " tenths of a second to show

set scrolloff=5 " show 5 lines of context when searching

" line and column makers
set cursorcolumn
set cursorline
hi CursorLine ctermbg=none cterm=underline gui=underline
hi CursorColumn ctermbg=none cterm=underline gui=underline
hi LineNr ctermfg=gray

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
"setlocal spell spelllang=en_au
:map <F5> :setlocal spell! spelllang=en_au<cr>
:imap <F5> <ESC>:setlocal spell! spelllang=en_au<cr>

map <C-n> :cn
map <C-p> :cp

"ctrl + a/e to move to end/start of lines
:map <C-a> ^
:map <C-e> $
:cmap <C-a> <home>
:cmap <C-e> <end>
:imap <C-e> <ESC>$i<right>
:imap <C-a> <ESC>^i

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

function! ReplaceTabsWithSpaces()
  if search('\t')
    :%s/\t/  /g
  endif
endfunction

function! RemoveDoubleBlankLines()
  if search('\n\s*\n\s*\n')
    :%s/\n\s*\n\s*\n/\r\r/g
  endif
endfunction

function! TidyWhiteSpace()
  if search('\S\s\+$')
    :%s/\(\S\)\s\+$/\1/
  endif
  call ReplaceTabsWithSpaces()
  call RemoveDoubleBlankLines()
endfunction

function! TidyWhiteSpaceAggressive()
  if search('\s\+$')
    :%s/\s\+$//
  endif
  call ReplaceTabsWithSpaces()
  call RemoveDoubleBlankLines()
endfunction

" makes gf always open in a new pane
nnoremap gf <C-W>f

" searching
set ignorecase
set hlsearch
set incsearch " highlight match while typing search pattern
set showmatch
set infercase " adjust case of match for keyword completion

" make backspace work properly
set backspace=indent,eol,start " allow backspacing over everything in insert mode

" backup files
set nobackup

" Use Ack instead of grep

" tabs
set expandtab " use spaces when <Tab> is inserted
set shiftwidth=2 " number of spaces to use for (auto)indent step
set softtabstop=2
set tabstop=2


set tags=./tags;

set hidden "allow buffers to be hidden without writing to disk

runtime macros/matchit.vim " better pair matching for %

set wildmode=list:longest " better filename completion


"make trailing whitespace obvious
"set listchars=tab:>-,trail:·,eol:$
set listchars=tab:>-,trail:·
set nolist!



let mapleader = ","

vmap <Leader>b :<C-U>!git blame <C-R>=expand("%:p") <CR> \| sed -n <C-R>=line("'<") <CR>,<C-R>=line("'>") <CR>p <CR>
map <Leader>w :call TidyWhiteSpace()<CR>
map <Leader>W :call TidyWhiteSpaceAggressive()<CR>
map <leader>i ggVG=
map <Leader>s :!spec -f n <C-R>=SpecFileName() <CR> 2> /dev/null <CR>
map <Leader>S :!spec -f n <C-R>=SpecFileName() <CR> <CR>
map <Leader>j :vs <C-R>=SpecOrCodeToggle() <CR> <CR>

"surrounding highlighted strings
vmap <Leader>q" xi""<esc>hp
vmap <Leader>q' xi''<esc>hp
vmap <Leader>q( xi()<esc>hp
vmap <Leader>q{ xi{}<esc>hp
vmap <Leader>q[ xi[]<esc>hp
vmap <Leader>q# xi#{}<esc>hp

"align on hashrockets
vmap <Leader>a :Align =><CR>

"git blame
map <Leader>g :Gblame<CR>

"replace 'blah' with '"blah: #{blah}"'
vmap <Leader>qd xi"<esc>pi: <right>#{}"<esc>hhp

" , space will clear search
nnoremap <leader><space> :noh<cr>

" tab to go to matched bracket
nnoremap <tab> %
vnoremap <tab> %



"set foldenable " set to display all folds open
"set history=500
"set diffopt=icase,iwhite,context:4,filler
"set showcmd " show (partial) command in status line
"set sidescrolloff=4 " min. nr. of columns to left andright of cursor

"autocmd VimEnter * NERDTree "open NERDTree when vim opens
"autocmd VimEnter * set nocursorcolumn "turn off the cursorcolumn in the nerdtree pane that is now selected
"autocmd VimEnter * wincmd p "change to the main pane

"trying out ctrl+l = hashrocket
imap <C-l> <Space>=><Space>"


au BufNewFile,BufRead *.zsh*  setfiletype zsh


