-- packer installation
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function(use)

  use 'dracula/vim'
  --use {"ellisonleao/gruvbox.nvim", requires = {"rktjmp/lush.nvim"}}
  use 'lukas-reineke/indent-blankline.nvim'
  use 'norcalli/nvim-colorizer.lua'
  use 'shaunsingh/nord.nvim'
  use 'sunjon/shade.nvim'
  use 'winston0410/cmd-parser.nvim'
  use 'winston0410/range-highlight.nvim'


  if packer_bootstrap then
    require('packer').sync()
  end

  ---- norcalli/nvim-colorizer.lua
  require 'colorizer'.setup()

  ---- sunjon/shade.nvim
  require'shade'.setup({
    overlay_opacity = 69,
    opacity_step = 1,
    keys = {
      brightness_up    = '<C-Up>',
      brightness_down  = '<C-Down>',
      toggle           = '<Leader>s',
    }
  })

  ---- winstone0410/range-highlight.nvim
  require'range-highlight'.setup{}

end)

