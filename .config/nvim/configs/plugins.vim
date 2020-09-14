" install vim-plugged if not already installed
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim -- create-dirs
  \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstaller --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" Status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

" git wrapper
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'airblade/vim-gitgutter'

" Nerd Commenter
Plug 'scrooloose/nerdcommenter'

" autosaving
Plug '907th/vim-auto-save'

" code snippets engine
Plug 'SirVer/ultisnips'

" snippets for ultisnips
Plug 'honza/vim-snippets'

" vim surround
Plug 'tpope/vim-surround'

" hex color code
Plug 'gorodinskiy/vim-coloresque'
Plug 'lilydjwg/colorizer'

" colorscheme
Plug 'joshdick/onedark.vim'
