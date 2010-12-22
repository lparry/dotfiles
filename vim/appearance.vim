" visual stuff
syntax on

if has("gui_running")
  set background=light
else
  set background=dark
endif

"256 color terminal support (ie. iTerm.app on osx)
set t_Co=256

set guifont=Inconsolata:h18

set wrap
set number " line numbers
set ruler " show cursor line and column in the status line
set showmatch " briefly jump to matching bracket
set matchtime=10 " tenths of a second to show

set guioptions=ce "use console dialog for messages, hide menubar and scrollbars. who needs em?

set scrolloff=5 " show 5 lines of context when searching

set listchars=tab:>-,trail:·
set nolist!

set laststatus=2
set statusline=%F%m%r%h%w\ %{fugitive#statusline()}\ [format:%{&ff}]\ [type:%y]\ [ascii:\%03.3b]\ [hex:\%02.2B]\ [pos:%l,%v][%p%%]\ [len:%L]

colorscheme railscasts
"make visual mode stand out better
highlight Visual guibg=#FF0000 ctermbg=60
highlight Search guifg=NONE ctermfg=NONE guibg=#990000 ctermbg=235 gui=italic cterm=underline
" line and column makers
highlight CursorLine ctermbg=none cterm=underline gui=underline
highlight CursorColumn ctermbg=none cterm=underline gui=underline
set cursorcolumn
set cursorline
highlight LineNr ctermfg=gray
