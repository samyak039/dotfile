" 
"                                   _     ___ ____   ___  
"                                  | |   / _ \___ \ / _ \       Samyak Bardiya
"   ___  __ _ _ __ ___  _   _  __ _| | _| | | |__) | (_) |      --------------
"  / __|/ _` | '_ ` _ \| | | |/ _` | |/ / | | |__ < \__, |      https://github.com/samyak039
"  \__ \ (_| | | | | | | |_| | (_| |   <| |_| |__) |  / / 
"  |___/\__,_|_| |_| |_|\__, |\__,_|_|\_\\___/____/  /_/  
"                       __/ |                            
"                      |___/                             
"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"       INDEX
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 
" ->> main config
" ->> maping
" ->> plugins
" ->> plugins configuration


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"       _MAIN CONFIGURATION
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set encoding=utf8                               " character encoding
set fileformats=unix,mac,dos                    " set fileformat to unix

set background=dark                             " set colorscheme for dark background
set printoptions+=syntax:y                      " prints syntax hightlighs

set shell=/usr/bin/zsh                              " zsh as default shell

syntax on                                       " turn on syntax highlighting
set termguicolors                               " make tui uses gui colors
set t_Co=256

set noshowmode                                  " no command line, when we have lightline
set statusline+=%F
set cmdheight=1                                 " command line height

set autoread                                    " auto reload file for external change

set mouse=a                                     " enables mouse scolling

set hidden                                      " allow a new buffer to be open without saving current

set ignorecase                                  " case insensitive search
set smartcase                                   " case sensitive when any letter is in uppercase
set hlsearch                                    " highlight while searching
set incsearch                                   " moves while searching

set smarttab                                    " makes tab smart, by using the below settings
set expandtab                                   " convert tabs to spaces
set tabstop=4                                   " tabs = 4 spaces
set softtabstop=4                               " while editing 4 spaces is treated as tabs

set smartindent                                 " turn on intend feature in new line
set autoindent                                  " uses shiftwidth to indend
set shiftwidth=4                                " how much to auto-intend
set shiftround                                  " uses multiple of shiftwidth

set backupdir=$HOME/.cache/nvim/backup/        " backup dir
set undodir=$HOME/.cache/nvim/undo/           " swap file dir
set dir=$HOME/.cache/nvim/swap/               " undo dir

set backupskip=/tmp/*,/private/tmp/*            " do not backup to temp files
"set backup                                      " backup old file
"set writebackup                                 " backup overwritten file

set wrap                                        " wraps long lines below

set splitright splitbelow                                  " new window opens on the right side

set clipboard+=unnamedplus                      " sync system clipboard with vim clipboard

set scrolloff=5                                 " horizontal lines to leave when scrolling
set sidescrolloff=5                             " verticle lines to leave when scrolling

set formatoptions-=cro                          " disable auto-commenting
"set formatoptions=vcroql

autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" highlight current line and current column
set nocursorline nocursorcolumn                                                 " turn off any highlighting
augroup cursorHighlightToggle
	autocmd!
	autocmd InsertEnter * set cursorline cursorcolumn        " turn on cursor highlight in insert mode
	autocmd BufEnter,FocusGained,InsertLeave * set nocursorline nocursorcolumn  " turn off cursor highlight in normal mode
augroup END


"" forcefully save and quit (doas -n instead of sudo so no password required)
command! W execute 'w !doas -n -u root -- tee > /dev/null %' <bar> edit!

"" jump back to last position when opening a file
if has("autocmd")
    autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
        \| exe "normal! g'\"" | endif
endif

"" hybrid line number (absolute + relative)
set number relativenumber                                      " turn on absolute numbering
"augroup numbertoggle
"	autocmd!
"	autocmd BufEnter,FocusGained,InsertLeave * set relativenumber       " turn on relative numbering in normal mode
"	autocmd BufLeave,FocusLost,InsertEnter * set norelativenumber       " turn of relative numbering in insert mode
"augroup END

"" delete trailing white space on save
fun! CleanExtraSpace()
  let save_cursor = getpos('.')
  let old_query = getreg('/')
  silent! %s/\s\+$//e
  call setpos('.', save_cursor)
  call setreg('/', old_query)
endfun

"" specific setting for text and markdown
augroup specify_filetype
    autocmd!
    autocmd BufRead,BufNewFile *.md set filetype=markdown
    autocmd BufRead,BufNewFile *.txt set filetype=text
    autocmd BufRead,BufNewFile *.tex set filetype=tex
augroup END
autocmd FileType text,tex,markdown setlocal spell                " spell check
autocmd FileType text,markdown,tex setlocal textwidth=100      " limit line length
set conceallevel=0                                              " no automatic collapse
hi SpellBad guibg=#ff5555 ctermbg=0


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"       _MAPING
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let mapleader = " "                             " space is the new leader
let maplocalleader = " "                        " local leader is also space

set timeout timeoutlen=1000                     " longer timeout for leader

" writes forcefully
nnoremap <leader>w :w!<return>
" quit
nnoremap <leader>q :q<return>
" write and quite
nnoremap <leader>wq :wq<return>
" force quit
nnoremap <leader>Q :q!<return>

" faster exit
inoremap ii <esc>
vnoremap ii <esc>

" better vertical scroll
nnoremap j gj
nnoremap k gk

" indent control
nnoremap < v<
nnoremap > v>
vnoremap < <gv
vnoremap > >gv

" text alignment
nnoremap <leader>Al :left<CR>
nnoremap <leader>Ac :center<CR>
nnoremap <leader>Ar :right<CR>
vnoremap <leader>Al :left<CR>
vnoremap <leader>Ac :center<CR>
vnoremap <leader>Ar :right<CR>

" quickly open a buffer for scribble
map <leader>nn :e $HOME/buffer<cr>
map <leader>nm :e $HOME/buffer.md<cr>

" --->> parenthesis / brackets
inoremap {{ {<esc>o}<esc>O
vnoremap (( <esc>`>a)<esc>`<i(<esc>
vnoremap {{ <esc>`>a{<esc>`<i}<esc>
vnoremap [[ <esc>`>a[<esc>`<i]<esc>
vnoremap "" <esc>`>a"<esc>`<i"<esc>
vnoremap '' <esc>`>a'<esc>`<i'<esc>

" --->> window navigation
" navigate to left, down, top, right
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l
" horizontal split then move to bottom window
nnoremap <leader>- <C-w>s
" vertical split then move to right window
nnoremap <leader>\ <C-w>v<C-w>l
" cycle tabs with Tab and Shift+Tab
nnoremap<silent> <Tab> :bnext<CR>
nnoremap<silent> <A-Tab> :bnext<CR>
nnoremap<silent> <S-Tab> :bprevious<CR>
" kill buffer with space+bk
nnoremap<silent> <Space><Backspace> :bdelete<CR>
" buffer related stuff
nnoremap <C-b>d :bdelete<CR>
nnoremap <C-b>n :bnext<CR>
nnoremap <C-b>p :bprevious<CR>

"" move line using ALT+[jk]
"nmap <M-j> mz:m+<cr>`z
"nmap <M-k> mz:m-2<cr>`z
"vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
"vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

" disable highlight when <leader>/ is pressed
map <silent> <leader>/ :noh<cr>

" cursor highlight toggle
nnoremap <leader>C :set cursorline! cursorcolumn!<return>
"inoremap <C-S-c> :set cursorline! cursorcolumn!<return>

" relative numebr toggle
nnoremap <leader>n :set relativenumber!<return>

" compile document, be it groff/LaTeX/markdown/etc.
map <leader>c :w! \| !compiler <c-r>%<CR>

" cleans out tex build files
autocmd VimLeave *.tex !texclear %

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"       _PLUG-INs
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" --->> insalls vim plug
""""""""""""""""""""""""""""""
if empty(glob('$HOME/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo $HOME/.local/share/nvim/site/autoload/plug.vim -- create-dirs
  \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstaller --sync | source $MYVIMRC
endif

call plug#begin('$DATA/nvim/plugged')               " init


Plug 'vim-airline/vim-airline'                  " airline - functional statusbar
Plug 'vim-airline/vim-airline-themes'           " airline theme - themes for the statusbar
Plug 'ctrlpvim/ctrlp.vim'                       " ctrlp - fuzzy finder
Plug 'junegunn/goyo.vim'                        " goyo - distraction free look
Plug 'lilydjwg/colorizer'                       " hex color
Plug 'Yggdroot/indentLine'                      " indent line
Plug 'junegunn/limelight.vim'                   " limelight - highlights only the current line
Plug 'jez/vim-superman'                         " MAN page in vim
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  } " markdown preview
Plug 'preservim/nerdtree'                       " nerdtree - directory viewer
Plug 'cwfoo/vim-text-omnicomplete'              " omnicomplete
Plug 'sheerun/vim-polyglot'                     " polyglot
Plug 'kana/vim-submode'                         " submode
Plug 'tpope/vim-surround'                       " surround - parenthesis management
Plug 'scrooloose/syntastic'                     " syntastic - syntax checker
Plug 'majutsushi/tagbar'                        " tagbar for all the classes and variables defined
Plug 'godlygeek/tabular'                        " tabular - for improved indentation for weird stuff
Plug 'dracula/vim', { 'as': 'dracula' }         " theme - dracula 
Plug 'morhetz/gruvbox'                          " theme - gruvbox
Plug 'arcticicestudio/nord-vim'                 " theme - nord
Plug 'sainnhe/gruvbox-material'                 " theme - gruvbox material
Plug 'freitass/todo.txt-vim'                    " todo.txt
Plug 'vimwiki/vimwiki'                          " vimwiki

Plug 'plasticboy/vim-markdown'                  " syntax - markdown


call plug#end()

Plug 'tpope/vim-vinegar'                        " vinegar - make netrw functional



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"       PLUG-INs CONFIGURATION
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" --->> _AIRLINE
""""""""""""""""""""""""""""""
let g:airline#extensions#nerdtree_status = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline_theme='dracula'

" --->> _DRACULA
""""""""""""""""""""""""""""""
let g:dracula_colorterm = 0
colorscheme dracula                             " sets colorscheme dracula

" --->> _INDENT_LINE
""""""""""""""""""""""""""""""
let g:indentLine_color_gui = '#6272a4'
"let g:indentLine_bgcolor_gui = '#FF5F00'
let g:indentLine_char = '|'

" --->> _NERDTREE
""""""""""""""""""""""""""""""
" binding for nerdtree
map <C-n> :NERDTreeToggle<CR>

" auto open
autocmd VimEnter * if argc() == 1 | NERDTree | wincmd p | else | NERDTree | endif

" auto exit on last file
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" customisatio
let g:NERDTreeSortOrder = ['[[extension]]']
"let g:NERDTreeStatusline = -1
let NERDTreeWinSize = 20

"" --->> _NETRW
"""""""""""""""""""""""""""""""
"set modifiable
"let g:netrw_banner = 0
"let g:netrw_liststyle = 3
"let g:netrw_browse_split = 4
"let g:netrw_winsize = 15
"let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+,\(^\|\s\s\)ntuser\.\S\+'
"autocmd FileType netrw set nolist
"
"" functions
"function! OpenBuffer()
"    :normal v
"    let g:path=expand('%:p')
"    execute 'q!'
"    execute 'e' g:path
"    :normal <C-w>l
"endfunction
"function! OpenToRight()
"    :normal v
"    let g:path=expand('%:p')
"    execute 'q!'
"    execute 'belowright vnew' g:path
"    :normal <C-w>l
"endfunction
"function! OpenBelow()
"    :normal v
"    let g:path=expand('%:p')
"    execute 'q!'
"    execute 'belowright new' g:path
"    :normal <C-w>l
"endfunction
"function! OpenTab()
"    :normal v
"    let g:path=expand('%:p')
"    execute 'q!'
"    execute 'tabedit' g:path
"    :normal <C-w>l
"endfunction
"function! NewBuffer()
"    :normal %
"    let g:path=expand('%:p')
"    execute 'q!'
"    execute 'tabedit' g:path
"    :normal <C-w>l
"endfunction
"
"" Allow for netrw to be toggled
"function! ToggleNetrw()
"    if g:NetrwIsOpen
"        let i = bufnr("$")
"        while (i >= 1)
"            if (getbufvar(i, "&filetype") == "netrw")
"                silent exe "bwipeout " . i
"            endif
"            let i-=1
"        endwhile
"        let g:NetrwIsOpen=0
"    else
"        let g:NetrwIsOpen=1
"        silent Lexplore
"        :normal <C-w>l
"    endif
"endfunction
"
"" Check before opening buffer on any file
"function! NetrwOnBufferOpen()
"    if exists('b:noNetrw')
"        return
"    endif
"    call ToggleNetrw()
"endfun
"
"" Close Netrw if it's the only buffer open
"autocmd WinEnter * if winnr('$') == 1 && getbufvar(winbufnr(winnr()), "&filetype") == "netrw" || &buftype == 'quickfix' |q|endif
"" Make netrw act like a project Draw
"augroup ProjectDrawer
"    autocmd!
"    " Don't open Netrw
"    autocmd VimEnter */.git/COMMIT_EDITMSG,man* let b:noNetrw=1
"    autocmd VimEnter * :call ToggleNetrw()
"augroup END
"
"let g:NetrwIsOpen=0
"
"function! NetrwMappings()
"    noremap <buffer> <A-l> <C-w>l
"    noremap <buffer> <C-l> <C-w>l
"    noremap <silent> <A-f> :call ToggleNetrw()<CR>
"    noremap <silent> <C-n> :call ToggleNetrw()<CR>
"    noremap <buffer> V :call OpenToRight()<cr>
"    noremap <buffer> H :call OpenBelow()<cr>
"    noremap <buffer> T :call OpenTab()<cr>
"    noremap <buffer> e :call OpenBuffer()<cr>
"endfunction
"
"augroup netrw_mappings
"    autocmd!
"    autocmd filetype netrw call NetrwMappings()
"augroup END

" --->> _SYNTASTIC
""""""""""""""""""""""""""""""
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" latex
let g:syntastic_tex_lacheck_quite_messages = { 'regex': '\Vpossible unwanted space at' }
let g:syntastic_tex_lacheck_quite_messages = { 'regex': '\Vunmatched "beginning of file main.tex"' }

" --->> _TAGBAR
""""""""""""""""""""""""""""""
autocmd FileType c,cpp nested :call tagbar#autoopen(1)
"autocmd VimEnter * nested :call tagbar#autoopen(1)
noremap <silent> <F8> :TagbarToggle<CR>


" config
let g:tagbar_position = 'right'
let g:tagbar_width = 30
let g:tagbar_autoshowtag = 1
let g:tagbar_sort = 0
"let g:tagbar_previewwin_pos = 'splitright'
"let g:tagbar_autopreview = 1


" --->> _GOYO
""""""""""""""""""""""""""""""
let g:goyo_width = "100+10"
let g:goyo_height = "90%" 
let g:goyo_linenr = 1
let g:limelight_conceal_guifg = '#777777'

map <leader>gy :Goyo<CR>

function! s:goyo_enter()
    silent !tmux set status off
    silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
    set noshowmode
    set noshowcmd
    set scrolloff=999
    Limelight
    " to quit vim even if Goyo is active
    let b:quitting = 0
    let b:quitting_bang = 0
    autocmd QuitPre <buffer> let b:quitting = 1
    cabbrev <buffer> q! let b:quitting_bang = 1 <bar> q!
endfunction

function! s:goyo_leave()
    silent !tmux set status on
    silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
    set showmode
    set showcmd
    set scrolloff=5
    Limelight!
  " Quit Vim if this is the only remaining buffer
    if b:quitting && len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) == 1
        if b:quitting_bang
            qa!
        else
            qa
        endif
    endif
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()
"autocmd BufRead,BufNewFile *.md :Goyo
"autocmd BufRead,BufNewFile /home/samyak039/WIKI* :Goyo | set bg=light


" --->> _MARKDOWN
""""""""""""""""""""""""""""""
let g:vim_markdown_folding_disabled = 1
set conceallevel=2
let g:vim_markdown_math = 1
let g:vim_markdown_strikethrough = 1


" --->> _MARKDOWN-PREVIEW
""""""""""""""""""""""""""""""
" set to 1, nvim will open the preview window after entering the markdown buffer
" default: 0
let g:mkdp_auto_start = 0

" set to 1, the nvim will auto close current preview window when change from markdown buffer to another buffer
" default: 1
let g:mkdp_auto_close = 1

" set to 1, the vim will refresh markdown when save the buffer or leave from insert mode, default 0 is auto refresh markdown as you edit or move the cursor
" default: 0
let g:mkdp_refresh_slow = 0

" set to 1, the MarkdownPreview command can be use for all files, by default it can be use in markdown file
" default: 0
let g:mkdp_command_for_global = 0

" set to 1, preview server available to others in your network by default, the server listens on localhost (127.0.0.1)
" default: 0
let g:mkdp_open_to_the_world = 0

" use custom IP to open preview page useful when you work in remote vim and preview on local browser more detail see: https://github.com/iamcco/markdown-preview.nvim/pull/9
" default: ''
let g:mkdp_open_ip = ''

" specify browser to open preview page
" default: ''
let g:mkdp_browser = 'qutebrowser'

" set to 1, echo preview page url in command line when open preview page
" default is 0
let g:mkdp_echo_preview_url = 0

" a custom vim function name to open preview page this function will receive url as param
" default: ''
let g:mkdp_browserfunc = ''

" options for markdown render
" mkit: markdown-it options for render
" katex: katex options for math
" uml: markdown-it-plantuml options
" maid: mermaid options
" disable_sync_scroll: if disable sync scroll, default 0
" sync_scroll_type: 'middle', 'top' or 'relative', default: 'middle'
"   middle: mean the cursor position alway show at the middle of the preview page
"   top: mean the vim top viewport alway show at the top of the preview page
"   relative: mean the cursor position alway show at the relative positon of the preview page
" hide_yaml_meta: if hide yaml metadata, default is 1
" sequence_diagrams: js-sequence-diagrams options
" content_editable: if enable content editable for preview page, default: v:false
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'relative',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {},
    \ 'flowchart_diagrams': {},
    \ 'content_editable': v:false
    \ }

" use a custom markdown style must be absolute path
" like '/Users/username/markdown.css' or expand('~/markdown.css')
let g:mkdp_markdown_css = ''

" use a custom highlight style must absolute path
" like '/Users/username/highlight.css' or expand('~/highlight.css')
let g:mkdp_highlight_css = ''

" use a custom port to start server or random for empty
let g:mkdp_port = ''

" preview page title
" ${name} will be replace with the file name
let g:mkdp_page_title = '「${name}」'

" normal/insert
" <Plug>MarkdownPreview
" <Plug>MarkdownPreviewStop
" nmap <C-p> <Plug>MarkdownPreviewToggle


" --->> _SUBMODE
""""""""""""""""""""""""""""""
call submode#enter_with('undo/redo', 'n', '', 'g-', 'g-')
call submode#enter_with('undo/redo', 'n', '', 'g+', 'g+')
call submode#leave_with('undo/redo', 'n', '', '<Esc>')
call submode#map('undo/redo', 'n', '', '-', 'g-')
call submode#map('undo/redo', 'n', '', '+', 'g+')

call submode#enter_with('resizeBuffer', 'n', '', '<C-w>+', '<C-w>+')
call submode#enter_with('resizeBuffer', 'n', '', '<C-w>-', '<C-w>-')
call submode#enter_with('resizeBuffer', 'n', '', '<C-w><', '<C-w><')
call submode#enter_with('resizeBuffer', 'n', '', '<C-w>>', '<C-w>>')
call submode#leave_with('resizeBuffer', 'n', '', '<Esc>')
call submode#map('resizeBuffer', 'n', '', '+', '<C-w>+')
call submode#map('resizeBuffer', 'n', '', '-', '<C-w>-')
call submode#map('resizeBuffer', 'n', '', '>', '<C-w>>')
call submode#map('resizeBuffer', 'n', '', '<', '<C-w><')


" --->> _WIKI | _VIMWIKI
""""""""""""""""""""""""""""""

" default wiki
let wiki_def = {}
let wiki_def.path = '~/wiki/vimwiki'
let wiki_def.path_html = '~/wiki/vimwiki/output'
" study wiki
let wiki_study = {}
let wiki_study.path = '~/wiki/study'
let wiki_study.path_html = '~/wiki/study/output'
" college wiki
let wiki_college = {}
let wiki_college.path = '~/wiki/college'
let wiki_college.ext = '.md'
let wiki_college.syntax = 'markdown'
let wiki_college.path_html = '~/wiki/college/output'
let wiki_college.custom_wiki2html= 'vimwiki_markdown'
let wiki_college.html_filename_parameterization= 1
" vimwiki_list
let g:vimwiki_list = [wiki_def, wiki_study, wiki_college]

" heading colors
hi VimwikiHeader1 guifg=#FF5555 gui=bold
hi VimwikiHeader2 guifg=#F1FA8C gui=bold
hi VimwikiHeader3 guifg=#50FA7B gui=bold
hi VimwikiHeader4 guifg=#FF79C6 gui=bold
hi VimwikiHeader5 guifg=#8BE9FD gui=bold
hi VimwikiHeader6 guifg=#FFB86C gui=bold

" --->> _OMNICOMPLETE
""""""""""""""""""""""""""""""
autocmd FileType markdown,text setlocal omnifunc=text_omnicomplete#OmniComplete


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"       EXTRA
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" --->> cursor highlight
""""""""""""""""""""""""""""""
"function! CursorHi()
"    set cursorline cursorcolumn
"endfunction
"
"function! NoCursorHi()
"    set nocursorline nocursorcolumn
"endfunction
"
"nnoremap v v:set nocursorline nocursorcolumn<CR>
"nnoremap V V:set nocursorline nocursorcolumn<CR>
"nnoremap <C-v> <C-v>:set nocursorline nocursorcolumn<CR>
"
"vnoremap <silent> <Esc> <Esc>:set cursorline cursorcolumn<CR>
"vnoremap <silent> <script> <Esc> <Esc><SID>CursorHi<Esc>
