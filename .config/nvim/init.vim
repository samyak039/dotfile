"==================================================================================================
"                                   _     ___ ____   ___
"                                  | |   / _ \___ \ / _ \       Samyak Bardiya
"   ___  __ _ _ __ ___  _   _  __ _| | _| | | |__) | (_) |      ==============
"  / __|/ _` | '_ ` _ \| | | |/ _` | |/ / | | |__ < \__, |      samyak039@gmail.com
"  \__ \ (_| | | | | | | |_| | (_| |   <| |_| |__) |  / /       https://gitlab.com/samyak039
"  |___/\__,_|_| |_| |_|\__, |\__,_|_|\_\\___/____/  /_/        https://t.me/samyak039
"                       __/ |
"                      |___/
"
"===================================================================================================

" + INDEX
" +-> basic
" +-> mapping
" +-> advanced
" +-> plugins
"  +--> plugins settings

"---------------------------------------------------------------------------------------------------
" BASIC
"---------------------------------------------------------------------------------------------------
source ~/.config/nvim/plug.vim

set background=dark
colorscheme gruvbox
set clipboard+=unnamedplus
set hidden
set list lcs=tab:\|\ ,trail:-,extends:>,precedes:<,nbsp:+
set mouse=a
set shell=/usr/bin/zsh
set termguicolors
set wrap
"set wildmode=longest,list,full

" formating
set cursorline cursorcolumn
set number relativenumber
set ignorecase smartcase hlsearch incsearch
set splitright splitbelow
set scrolloff=5 sidescrolloff=3
set smartindent shiftround shiftwidth=4
set tabstop=4 softtabstop=4 noexpandtab

filetype plugin on
syntax on

" setting directories
set dir=$HOME/.cache/nvim/swap/
set undodir=$HOME/.cache/nvim/undo/
set backupdir=$HOME/.cache/nvim/backup/
set backupskip=/tmp/*,/private/tmp/*
set undofile


"---------------------------------------------------------------------------------------------------
" MAPPING
"---------------------------------------------------------------------------------------------------
let mapleader = " "
let maplocalleader = " "

command! W execute 'w !doas -n -u root -- tee > /dev/null %' <bar> edit!

noremap ; :
noremap : ;
noremap <C-n> :Lexplore<CR>
noremap <C-s> :UndotreeToggle<CR>
noremap <C-t> :TagbarToggle<CR>

nnoremap <silent> < v<
nnoremap <silent> > v>
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l
nnoremap <A-n> :bnext<CR>
nnoremap <A-p> :bprevious<CR>
nnoremap <A-s> :%s//gI<Left><Left><Left>
nnoremap <A-t> :set expandtab!<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>Q :q!<CR>
nnoremap <leader>w :w!<CR>
nnoremap <leader>wq :wq<CR>
nnoremap <leader>W :W<CR>

"inoremap '' ''<left>
"inoremap "" ""<left>
"inoremap (( ()<left>
"inoremap [[ []<left>
inoremap {{ {<esc>o}<esc>O

vnoremap <silent> < <gv
vnoremap <silent> > >gv


"---------------------------------------------------------------------------------------------------
" ADVANCED
"---------------------------------------------------------------------------------------------------
" Disables automatic commenting on newline:
autocmd VimEnter * setlocal formatoptions-=cro

" jump back to last position
if has("autocmd")
	autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
		\| exe "normal! g'\"" | endif
endif

" specific settings for file type
autocmd FileType markdown,tex,text setlocal spell			   " spell check
autocmd FileType markdown,tex,text setlocal textwidth=100	   " limit line length
autocmd VimLeave *.tex !texclear %

augroup competitiveProgramming
	autocmd! competitiveProgramming
	" for initial template
	autocmd Filetype c nnoremap <leader><leader>i :-1 read ~/.config/templates/cp.c<CR>/<++><CR>cc
	autocmd Filetype cpp nnoremap <leader><leader>i :-1read ~/.config/templates/cp.cpp<CR>/<++><CR>cc
	autocmd Filetype sh nnoremap <leader><leader>i :-1read ~/.config/templates/template.sh<CR>/<++><CR>cc
	" for compiling
	autocmd Filetype c nnoremap <leader><leader>c :!gcc -o %:r %<CR>
	autocmd Filetype cpp nnoremap <leader><leader>c :!g++ -o %:r %<CR>
	" for running (without testcase)
	autocmd Filetype c,cpp nnoremap <leader><leader>r :!time ./%:r<CR>
	autocmd Filetype sh nnoremap <leader><leader>r :!time bash %<CR>
	" for running with TESTCASES
	autocmd Filetype c,cpp nnoremap <leader><leader>t :!for f in *_test; do echo "\n$f\n======="; /usr/bin/time ./%:r < $f; done<CR>
	autocmd Filetype sh nnoremap <leader><leader>t :!for f in *_test; do echo "\n$f\n======="; /usr/bin/time bash % < $f; done<CR>
	" for convinence
	nnoremap <leader><leader>w :w<CR>
augroup end
