-- 
--           _     _
--  ___  ___| |_  | |_   _  __ _
-- / __|/ _ \ __| | | | | |/ _` |
-- \__ \  __/ |_ _| | |_| | (_| |
-- |___/\___|\__(_)_|\__,_|\__,_|
-- 
-- 
-- @samyak039

-- NOTE: `vim.o` is short for `vim.opt`
-- note

-- copy to clipboard / register == clipboard
vim.o.clipboard = 'unnamedplus'

vim.o.mouse = 'a'

vim.o.termguicolors = true

vim.o.cursorline = true
vim.o.cursorcolumn = true

vim.o.smartcase = true

-- correct splits
vim.o.splitright = true
vim.o.splitbelow = true

-- why NEOVIM
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true

vim.o.number = true
vim.o.relativenumber = true

vim.o.dir = os.getenv('XDG_CACHE_HOME') .. '/nvim/swap'
vim.o.backupdir = os.getenv('XDG_CACHE_HOME') .. '/nvim/backup'
vim.o.undofile = true
vim.o.undodir = os.getenv('XDG_CACHE_HOME') .. '/nvim/undo'


vim.o.incsearch = true


vim.o.colorcolumn = '80'
