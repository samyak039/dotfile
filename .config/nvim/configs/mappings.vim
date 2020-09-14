" set leader to space bar
let mapleader = " "
let maplocalleader = " "

"""""""""""""""""""""""""""""""""""""""""""""""""
" MINE
"""""""""""""""""""""""""""""""""""""""""""""""""
" write forcefully
nnoremap <leader>w :w!<CR>
" quit
nnoremap <leader>q :q<CR>
" quit forefully
nnoremap <leader>Q :q!<CR>
nnoremap <leader>wq :wq<CR>
" to add a ; at the end and to move to the new lien
nnoremap ; A;<Esc>o
inoremap ;; <Esc>A;<Esc>o
"""""""""""""""""""""""""""""""""""""""""""""""""
command! W execute 'w !sudo tee % > /dev/null' <bar> edit!
command! Q execute 'q!'
"""""""""""""""""""""""""""""""""""""""""""""""""

" window navigation
" navigate to left window
nnoremap <C-h> <C-w>h
" navigate to down window
nnoremap <C-j> <C-w>j
" navigate to top window
nnoremap <C-k> <C-w>k
" navigate to right window
nnoremap <C-l> <C-w>l
" horizontal split then move to bottom window
nnoremap <leader>- <C-w>s
" vertical split then move to right window
nnoremap <leader>\ <C-w>v<C-w>l
" cycle tabs with Tab and Shift+Tab
nnoremap<silent> <Tab> :bnext<CR>
nnoremap<silent> <S-Tab> :bprevious<CR>
" kill buffer with space+bk
nnoremap<silent> <Space><Backspace> :bdelete<CR>

" faster esc
inoremap ii <ESC>
vnoremap ii <ESC>

" better append
nnoremap a A
nnoremap A I
nnoremap I a

" indent controls
" reselect text after indent/unindent
vnoremap < <gv
vnoremap > >gv
" tab to indent in visual mode
vnoremap <Tab> >gv
" Shift+Tab to unindet in visual mode.
vnoremap <S-Tab> <gv

" text alignment
nnoremap <leader>Al :left<CR>
nnoremap <leader>Ac :center<CR>
nnoremap <leader>Ar :right<CR>
vnoremap <leader>Al :left<CR>
vnoremap <leader>Ac :center<CR>
vnoremap <leader>Ar :right<CR>

" disable highlight when <leader>/ is pressed
map <silent> <leader>/ :noh<cr>

" move line using ALT+[jk]
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

" quickly open a buffer for scribble
map <leader>nn :e ~/buffer<cr>

" quickly open a markdown buffer for scribbl.
map <leader>nm :e ~/buffer.md<cr>

" toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>

" parenthesis / brackets
vnoremap (( <esc>`>a)<esc>`<i(<esc>
vnoremap {{ <esc>`>a{<esc>`<i}<esc>
vnoremap [[ <esc>`>a[<esc>`<i]<esc>
vnoremap "" <esc>`>a"<esc>`<i"<esc>
vnoremap '' <esc>`>a'<esc>`<i'<esc>

" auto parenthesis
"inoremap (( ()<esc>i
"inoremap {} {}<esc>i
"inoremap {{ {<esc>o}<esc>O
"inoremap [[ []<esc>i
"inoremap '' ''<esc>i
"inoremap "" ""<esc>i
"inoremap }} <esc>A {<esc>o}<esc>O

