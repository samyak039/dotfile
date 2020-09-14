" Colorsheme
"""""""""""""""""""""""""""""""""""""""""""""""""colorscheme wal
colorscheme default
set background=dark

augroup specify_filetype
	autocmd!
	autocmd BufRead,BufNewFile *.md set filetype=markdown
	autocmd BufRead,BufNewFile *.txt set filetype=text
augroup END

set encoding=utf8
set ffs=unix,mac,dos

" Longer leader key timeout
set timeout timeoutlen=1000

" Enable spell-checking for certain files
autocmd FileType text,markdown setlocal spell

" limit line length for text files
autocmd FileType text,markdown,tex setlocal textwidth=130

" don't automatically collapse markdown
set conceallevel=0

" don't display mode in command line (airline already shows it)
set noshowmode

" auto re-read file (external changes)
set autoread

" no case-sensitive search unless uppercase is present
set ignorecase
set smartcase

" highlight while searching
set hlsearch

" moves while searching
set incsearch

" enable mouse scroll
set mouse=a

" allow a new buffer to be opened without saving current
set hidden

" statusline config
set statusline+=%F
set cmdheight=1

" tab settings
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smarttab
set autoindent
set smartindent
set shiftround

" enable syntax highlighting
syntax on

" print syntax hightlighting
set printoptions+=syntax:y

" keep a backup flie
" set backup

" save undo tree
" set undofile

" do not back up to temporary files
set backupskip=/tmp/*,/private/tmp/*"

" store backup files in one place
set backupdir^=$HOME/.config/nvim/storage/backup/

" store swap files in one place 
set undodir^=$HOME/.config/nvim/storage/swaps/

" store undo files in one place
set dir^=$HOME/.config/nvim/storage/undos/

" line wrapping
set wrap

" turns on detection for filetypes, indentation files and plugin files
filetype plugin indent on

" split window appears on right of current one
set splitright

" make sure compatible mode is disabled
"""""""""""""""""""""""""""""""""""""""""""""""""set nocampatible

" share yank buffer with system clipboard
set clipboard=unnamedplus

" show next 3 lines while scrollin
set scrolloff=5

" show next 5 columns while side-scrolling
set sidescrolloff=5

" jump to the last known position when reopening a file
if has("autocmd")
	au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
		\| exe "normal! g'\"" | endif
endif

" relative line number
set number
augroup numbertoggle
	autocmd!
	autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
	autocmd BufLeave,FocusLost,InsertEnter * set norelativenumber
augroup END

" delete trailing white space on save
fun! CleanExtraSpace()
  let save_cursor = getpos('.')
  let old_query = getreg('/')
  silent! %s/\s\+$//e
  call setpos('.', save_cursor)
  call setreg('/', old_query)
endfun

" highlight current line
:set cursorline

" cursor color
highlight Cursor guifg=red guibg=black
highlight iCursor guifg=red guibg=steelblue
set guicursor=n-v-c:block-Cursor
set guicursor+=i:ver100-iCursor
set guicursor+=n-v-c:blinkon0
set guicursor+=i:blink
if &term =~ "xterm\\|rxvt"
  " use an orange cursor in insert mode
  let &t_SI = "\<Esc>]12;orange\x7"
  " use a red cursor otherwise
  let &t_EI = "\<Esc>]12;red\x7"
  silent !echo -ne "\033]12;red\007"
  " reset cursor when vim exits
  autocmd VimLeave * silent !echo -ne "\033]112\007"
  " use \003]12;gray\007 for gnome-terminal and rxvt up to version 9.21
endif
