"" luochen1990/rainbow
let g:rainbow_active = 1

"" machakann/vim-highlightedyank
let g:highlightedyank_highlight_duration = 200

"" mbbill/undotree
let g:undotree_WindowLayout = 4
let g:undotree_ShortIndicators = 0
let g:undotree_RelativeTimestamp = 1
let g:undotree_HighlightChangedWithSign = 1

"" morhetz/gruvbox
let g:gruvbox_italic=1
let g:gruvbox_contrast_dark='hard'
let g:gruvbox_contrast_light='hard'
"let g:gruvbox_vert_split='fg0'
let g:gruvbox_italicize_comments=0
let g:gruvbox_italicize_strings=1
let g:gruvbox_invert_signs=1
let g:gruvbox_invert_indent_guides=1
let g:gruvbox_invert_tabline=1
let g:gruvxox_improved_warnings=1

"" vim/netrw
set modifiable
let g:netrw_altv = 1
let g:netrw_banner = 1
let g:netrw_browse_split = 4
let g:netrw_liststyle = 3
let g:netrw_winsize = 15
let g:netrw_list_hide = netrw_gitignore#Hide().'\(^\|\s\s\)\zs\.\S\+'
autocmd FileType netrw set nolist
autocmd FileType netrw setl bufhidden=wipe
" auto-open and focus on text file
"autocmd VimEnter * if argc() != 0 | Lexplore | wincmd p | else | Lexplore | endif
" Close Netrw if it's the only buffer open
autocmd WinEnter * if winnr('$') == 1 && getbufvar(winbufnr(winnr()), "&filetype") == "netrw" || &buftype == 'quickfix' | q! | endif
" when netrw should not be called
"autocmd FileType man Lexplore

"" preservim/tagbar
"autocmd FileType c,cpp nested :call tagbar#autoopen(1)
""autocmd VimEnter * nested :call tagbar#autoopen(1)
let g:tagbar_position = 'botright vertical'
let g:tagbar_width = 20
let g:tagbar_autoshowtag = 1
let g:tagbar_sort = 0
autocmd FileType markdown,vimwiki let g:tagbar_position = 'topleft vertical'
autocmd FileType markdown,vimwiki let g:tagbar_width = 45
let g:tagbar_type_markdown = {
    \ 'ctagstype': 'markdown',
    \ 'ctagsbin' : '/home/samyak039/.local/bin/markdown2ctags.py',
    \ 'ctagsargs' : '-f - --sort=yes --sro=»',
    \ 'kinds' : [
        \ 's:sections',
        \ 'i:images'
    \ ],
    \ 'sro' : '»',
    \ 'kind2scope' : {
        \ 's' : 'section',
    \ },
    \ 'sort': 0,
\ }
let g:tagbar_type_vimwiki = {
    \ 'ctagstype': 'vimwiki',
    \ 'ctagsbin' : '/home/samyak039/.local/bin/markdown2ctags.py',
    \ 'ctagsargs' : '-f - --sort=yes --sro=»',
    \ 'kinds' : [
        \ 's:sections',
        \ 'i:images'
    \ ],
    \ 'sro' : '»',
    \ 'kind2scope' : {
        \ 's' : 'section',
    \ },
    \ 'sort': 0,
\ }
"let g:tagbar_type_vimwiki = {
"          \   'ctagstype':'vimwiki'
"          \ , 'kinds':['h:header']
"          \ , 'sro':'&&&'
"          \ , 'kind2scope':{'h':'header'}
"          \ , 'sort':0
"          \ , 'ctagsbin':'$HOME/.local/bin/markdown2ctags.py'
"          \ , 'ctagsargs': 'default'
"          \ }

"" plasticboy/vim-markdown
let g:vim_markdown_folding_disabled = 1
set conceallevel=2
let g:vim_markdown_conceal_code_blocks = 1
let g:vim_markdown_math = 1
let g:vim_markdown_frontmatter = 1

"" scrooloose/syntastic
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0

"" sheerun/vim-polyglot
let g:polyglot_disabled = ['autoindent']

"" vim-airline/vim-airline
"set showtabline=1
set noshowmode
let g:airline_theme='gruvbox'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_splits = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#whitespace#enabled = 0
"let g:airline_section_z = '%p%% %3l:%-2c'
let g:airline#extensions#default#layout = [
	\[ 'a', 'b', 'c' ],
	\[ 'x', 'z', 'error', 'warning' ]
	\]
" dict needed to be declared
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif
let g:airline_symbols.crypt = 'RO'
let g:airline_symbols.linenr = ''
let g:airline_symbols.maxlinenr = ''

"" vimwiki/vimwiki
" wiki: default, study, college
let g:vimwiki_list = [ { 'name' : 'wiki',
                       \ 'path' : '~/wiki/vimwiki',
                       \ 'ext' : '.md',
                       \ 'syntax' : 'markdown' },
                     \ { 'path' : '~/wiki/study',
                       \ 'ext' : '.md',
                       \ 'syntax' : 'markdown' },
                     \ { 'path' : '~/wiki/college',
                       \ 'ext' : '.md',
                       \ 'syntax' : 'markdown',
                       \ 'custom_wiki2html' : 'vimwiki_markdown',
                       \ 'html_filename_parameterization' : 1 } ]
" heading colors
let g:vimwiki_hl_headers = 1
hi VimwikiHeader1 guifg=#FB4934 gui=bold
hi VimwikiHeader2 guifg=#D3869B gui=bold
hi VimwikiHeader3 guifg=#458588 gui=bold
hi VimwikiHeader4 guifg=#FE8019 gui=bold
hi VimwikiHeader5 guifg=#B8BB26 gui=bold
hi VimwikiHeader6 guifg=#FABD2F gui=bold


"" junegunn/vim-plug
if empty(glob('$HOME/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo $HOME/.local/share/nvim/site/autoload/plug.vim -- create-dirs
  \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstaller --sync | source $MYVIMRC
endif
call plug#begin('$DATA/nvim/plugged')

Plug 'airblade/vim-gitgutter'
Plug 'arcticicestudio/nord-vim'
Plug 'dracula/vim', {'as':'dracula'}
Plug 'godlygeek/tabular'
Plug 'junegunn/goyo.vim'
Plug 'lilydjwg/colorizer'
Plug 'luochen1990/rainbow'
Plug 'machakann/vim-highlightedyank'
Plug 'mbbill/undotree'
Plug 'morhetz/gruvbox'
Plug 'plasticboy/vim-markdown'
Plug 'preservim/tagbar'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-vinegar'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-scripts/loremipsum'
Plug 'vim-scripts/restore_view.vim'
Plug 'vimwiki/vimwiki'

call plug#end()
