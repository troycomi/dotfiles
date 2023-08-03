local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd [[packadd packer.nvim]]
end

vim.cmd [[
augroup packer_user_config
  autocmd!
  autocmd BufWritePost plugins.lua source <afile> | PackerSync
augroup end
]]

local conf = {
  threshold = 0,
  max_jobs = 20,
  -- Have packer use a popup window
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "rounded" })
    end,
  },
}

local packer = require("packer")
packer.init(conf)

return packer.startup(function(use)

  use 'wbthomason/packer.nvim'

  -- color scheme
  use {
    'ellisonleao/gruvbox.nvim',
    config = require('user.config.gruvbox').setup(),
  }

  -- show colors of hex values
  use {
    'norcalli/nvim-colorizer.lua',
    config = function()
      require('user.config.nvim-colorizer').setup()
    end,
  }

  -- startup screen
  use {
    'goolord/alpha-nvim',
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = function()
      require('user.config.alpha-nvim')
    end,
  }

  -- essentials
  use {
    'numToStr/Comment.nvim',
    config = function()
      require('user.config.comment').setup()
    end
  }
  use {'tpope/vim-eunuch'}
  use {'tpope/vim-repeat'}
  use {'tpope/vim-abolish'}  -- S, crs
  use {
    'tpope/vim-surround',
    config = function()
      require('user.config.vim-surround').setup()
    end,
  }
  use {'tpope/vim-unimpaired'}
  use {'farmergreg/vim-lastplace'}
  use {
    'Darazaki/indent-o-matic',
    config = function()
      require('indent-o-matic').setup{
        max_lines = 1024,
        standard_widths = {2, 4},
        skip_multiline = true,
      }
    end,
  }

  -- tmux navigation
  use {
    'numToStr/Navigator.nvim',
    config = function()
      require('user.config.Navigator').setup()
    end,
  }

  -- statusline
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    config = function()
      require('user.config.lualine').setup()
    end,
  }

  -- nvim-tree
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icons
    },
    tag = 'nightly', -- optional, updated every week. (see issue #1193)
    config = function()
      require('user.config.nvim-tree').setup()
    end,
  }

  -- treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    config = function()
      require("user.config.treesitter").setup()
    end,
    requires = {
      {
        "nvim-treesitter/nvim-treesitter-textobjects" ,
        "andymass/vim-matchup",
        "windwp/nvim-ts-autotag",  -- Auto tag
      },
    },
  }

  use {
    "nvim-telescope/telescope.nvim",
    opt = true,
    config = function()
      require("user.config.telescope").setup()
    end,
    cmd = { "Telescope" },
    module = "telescope",
    keys = { "<leader>f", "<leader>p" },
    wants = {
      "plenary.nvim",
      "popup.nvim",
      "telescope-fzf-native.nvim",
      "telescope-project.nvim",
      "telescope-repo.nvim",
      "telescope-file-browser.nvim",
      "project.nvim",
    },
    requires = {
      "nvim-lua/popup.nvim",
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
      "nvim-telescope/telescope-project.nvim",
      "cljoly/telescope-repo.nvim",
      "nvim-telescope/telescope-file-browser.nvim",
      {
        "ahmedkhalf/project.nvim",
        config = function()
          require("project_nvim").setup {}
        end,
      },
      { "junegunn/fzf", run = "./install --all" },
    },
  }

  -- WhichKey
  use {
    "folke/which-key.nvim",
    config = function()
      require("user.config.whichkey").setup()
    end,
  }

  -- markdown preview
  use {
    "iamcco/markdown-preview.nvim",
    run = "cd app && npm install",
    setup = function() vim.g.mkdp_filetypes = { "markdown" } end,
    ft = { "markdown" },
  }

  -- motions
  use {"wellle/targets.vim"}  -- adds more text objects
  use {"unblevable/quick-scope"}  -- highlight matches on line

  -- ft specific
  use {'sam4llis/nvim-lua-gf'}
  use {'broadinstitute/vim-wdl'}
  use {'Vimjas/vim-python-pep8-indent'}
  -- work around rtp to make snakemake work...
  use {'snakemake/snakemake', rtp='misc/vim'}
  use '~/.local/share/nvim/site/pack/packer/start/snakemake/misc/vim'

  if packer_bootstrap then
    require('packer').sync()
  end
end)
