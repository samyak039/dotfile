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
if !exists('g:vscode')
    source ~/.config/nvim/plug.vim
    colorscheme gruvbox
endif

set background=dark
set clipboard+=unnamedplus
set hidden
set list lcs=tab:\|\ ,extends:>,precedes:<,nbsp:+
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
set tabstop=4 softtabstop=4 expandtab

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

command! W execute 'w !doas -u root -- tee > /dev/null %' <bar> edit!

inoremap {{ {<esc>o}<esc>O
nnoremap <silent> < v<
nnoremap <silent> > v>
nnoremap <silent> Y y$
vnoremap <silent> < <gv
vnoremap <silent> > >gv

nnoremap <leader>Q :q!<CR>
nnoremap <leader>W :W<CR>
nnoremap <leader>t :set expandtab!<CR>
nnoremap <leader>wq :wqa<CR>

noremap <C-n> :NERDTreeToggle<CR>
noremap <C-s> :UndotreeToggle<CR>
noremap <C-t> :TagbarToggle<CR>

nnoremap <A-d> :tabclose<CR>
nnoremap <A-e> :tabe 
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l
nnoremap <A-n> :tabnext<CR>
nnoremap <A-p> :tabprevious<CR>
"nnoremap <A-'> :wqa<CR>
nnoremap <A-s> :%s//gI<Left><Left><Left>
nnoremap <A-w> :w!<CR>

"inoremap '' ''<left>
"inoremap "" ""<left>
"inoremap (( ()<left>
"inoremap [[ []<left>



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
autocmd FileType markdown,tex,text setlocal spell               " spell check
autocmd FileType markdown,tex,text setlocal textwidth=100       " limit line length
augroup LaTeX
    autocmd Filetype tex nnoremap <A-c :w! \| !compiler "<c-r>%"<CR>
    autocmd Filetype tex nnoremap <A-r :!opout <c-r>%<CR><CR>
    autocmd VimLeave *.tex !texclear %
augroup end

augroup competitiveProgramming
    autocmd! competitiveProgramming
    " boiler plate
    autocmd Filetype c nnoremap <A-i> :-1 read ~/.local/share/boiler_plate/c_lang.c<CR>/<++><CR>cc
    autocmd Filetype cpp nnoremap <A-i> :-1read ~/.local/share/boiler_plate/c_plus_plus.cc<CR>/<++><CR>cc
    autocmd Filetype sh nnoremap <A-i> :-1read ~/.local/share/boiler_plate/shell.sh<CR>/<++><CR>cc
    " for compiling
    autocmd Filetype c nnoremap <A-c> :!gcc -o %:r %<CR>
    autocmd Filetype cpp nnoremap <A-c> :!g++ -o %:r %<CR>
    " for running (without testcase)
    autocmd Filetype c,cpp nnoremap <A-r> :!time ./%:r<CR>
    autocmd Filetype sh nnoremap <A-r> :!time bash %<CR>
    " for running with TESTCASES
    autocmd Filetype c,cpp nnoremap <A-t> :!for f in in*.txt; do echo "\n$f\n======="; time ./%:r < $f; done<CR>
    autocmd Filetype sh nnoremap <A-t> :!for f in *_test; do echo "\n$f\n======="; time bash % < $f; done<CR>
    " for convinence
    nnoremap <A-w :w<CR>
augroup end

