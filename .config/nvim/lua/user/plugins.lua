local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

-- returns the require for use in `config` parameter of packer's use
-- expects the name of the config file
local function get_config(name)
  return string.format('require("user/plugin_config/%s")', name)
end

-- bootstrap packer if not installed
if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
  print("Installing packer...")
  vim.api.nvim_command("packadd packer.nvim")
end

-- initialize and configure packer
local packer = require("packer")

packer.init({
  enable = true, -- enable profiling via :PackerCompile profile=true
  threshold = 0, -- the amount in ms that a plugins load time must be over for it to be included in the profile
  max_jobs = 20, -- Limit the number of simultaneous jobs. nil means no limit. Set to 20 in order to prevent PackerSync form being "stuck" -> https://github.com/wbthomason/packer.nvim/issues/746
  -- Have packer use a popup window
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "rounded" })
    end,
  },
})

packer.startup(function(use)
  use 'wbthomason/packer.nvim'

  use {'ellisonleao/gruvbox.nvim', config = get_config('gruvbox')}
  use {'NvChad/nvim-colorizer.lua', config = get_config('nvim-colorizer')}

  use {'tpope/vim-commentary'}
  use {'tpope/vim-eunuch'}
  use {'tpope/vim-repeat'}
  use {'tpope/vim-surround', config = get_config('vim-surround')}
  use {'tpope/vim-unimpaired'}

  use {'numToStr/Navigator.nvim', config = get_config('Navigator')}

  -- statusline
  use {
      'nvim-lualine/lualine.nvim',
      requires = { 'kyazdani42/nvim-web-devicons', opt = true },
      config = get_config('lualine'),
  }

  -- nvim-tree
  use {
      'kyazdani42/nvim-tree.lua',
      requires = {
          'kyazdani42/nvim-web-devicons', -- optional, for file icons
      },
      tag = 'nightly', -- optional, updated every week. (see issue #1193)
      config = get_config('nvim-tree'),
  }

  if PACKER_BOOTSTRAP then
      require("packer").sync()
  end

end)
