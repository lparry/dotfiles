"keyboard shortcuts
" spelling stuff
"setlocal spell spelllang=en_au
map <F5> :setlocal spell! spelllang=en_au<cr>
imap <F5> <ESC>:setlocal spell! spelllang=en_au<cr>

map <F6> :call rainbow_parentheses#Toggle()<cr>

map <C-n> :cn
map <C-p> :cp

"ctrl + a/e to move to end/start of lines
map <C-a> ^
map <C-e> $
cmap <C-a> <home>
cmap <C-e> <end>
imap <C-e> <ESC>$a
imap <C-a> <ESC>^i

"maximize windows
map _ <c-w>_

" colon commands (must start with capital letters sadly)
command W write
command Q quit  " compensate for my sloppy typing
command WQ write | quit
command Wq write | quit
command QW write | quit

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

" Bubble single lines
nmap <C-Up> ddkP
nmap <C-Down> ddp

let mapleader = ","

vmap <Leader>b :<C-U>!git blame <C-R>=expand("%:p") <CR> \| sed -n <C-R>=line("'<") <CR>,<C-R>=line("'>") <CR>p <CR>
map <Leader>w :call TidyWhiteSpace()<CR>
map <Leader>W :call TidyWhiteSpaceAggressive()<CR>
map <leader>i ggVG=
map <Leader>s :!spec -f n <C-R>=rspec#SpecFileName() <CR> 2> /dev/null <CR>
map <Leader>S :!spec -f n <C-R>=rspec#SpecFileName() <CR> <CR>
map <Leader>j :vs <C-R>=rspec#SpecOrCodeToggle() <CR> <CR>
map <Leader>cuke mcggVG=:%s/^\(\s*\)And/\1  And/<cr>:%s/^\(\s*\)Then/\1 Then/<cr>:%s/^\(\s*\)When/\1 When/<cr>,<space>`c

"surrounding highlighted strings
vmap <Leader>q" xi""<esc>hp
vmap <Leader>q' xi''<esc>hp
vmap <Leader>q( xi()<esc>hp
vmap <Leader>q{ xi{}<esc>hp
vmap <Leader>q[ xi[]<esc>hp
vmap <Leader>q# xi#{}<esc>hp

"align on hashrockets
vmap <Leader>=> :Align =><CR>

"Ack
map <Leader>ack :Ack

"git blame
map <Leader>g :Gblame<CR>

"replace 'blah' with '"blah: #{blah}"'
vmap <Leader>qd xi"<esc>pi: <right>#{}"<esc>hhp

" , space will clear search
nnoremap <leader><space> :noh<cr>

" tab to go to matched bracket
nnoremap <tab> %
vnoremap <tab> %

map <Leader>d :bd<cr>

"trying out ctrl+l = hashrocket
imap <C-l> <Space>=><Space>"

"disable arrow keys, so n00bs really cant use my vim :P
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

"apparently these two lines make vim use normal regex, sadly i know a mangle
"of vim and perl regex so it's gonna hurt for a bit
nnoremap / /\v
vnoremap / /\v

" makes gf always open in a new pane
nnoremap gf <C-W>f

"NERDTree
map <Leader>f :NERDTreeToggle<cr>
