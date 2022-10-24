local opt = vim.opt
local cmd = vim.api.nvim_command

vim.g.mapleader = " "

vim.cmd [[
    let g:clipboard = {
          \   'name': 'myClipboard',
          \   'copy': {
          \      '+': ['tmux', 'load-buffer', '-'],
          \      '*': ['tmux', 'load-buffer', '-'],
          \    },
          \   'paste': {
          \      '+': ['tmux', 'save-buffer', '-'],
          \      '*': ['tmux', 'save-buffer', '-'],
          \   },
          \   'cache_enabled': 1,
          \ }
]]

opt.autoindent = true
opt.colorcolumn = '79'
opt.equalalways = true  -- resize windows automatically
opt.expandtab = true
opt.foldcolumn = '2'
opt.foldmethod = "syntax"
opt.hidden = true
opt.hlsearch = true
opt.incsearch = true
opt.laststatus = 2
opt.number = true
opt.relativenumber = true
opt.scrolloff = 5  -- keep top and bottom lines shown
opt.shiftwidth = 4
opt.signcolumn = "yes"
opt.smartindent = true
opt.smarttab = true
opt.softtabstop = 4
opt.tabstop = 4
opt.termguicolors = true
opt.textwidth = 0
opt.timeoutlen = 300
opt.undofile = true
opt.wrap = false

opt.encoding = "utf-8"
opt.hidden = true -- Hide unloaded buffer
opt.lazyredraw = true -- Don't redraw easily
opt.ttyfast = true -- Performance related
opt.spell = true -- spell check

opt.splitright = true -- Vertical split always on the right
opt.splitbelow = true -- Horizontal split always on the bottom

opt.fillchars = {
  vert = "│",
  fold = " ",
  eob = " ",
  diff = "",
  msgsep = "‾",
  foldopen = "▾",
  foldsep = "│",
  foldclose = "▸",
}

opt.breakindent = true
opt.joinspaces = true

opt.wildignorecase = true
opt.wildignore = {
  ".pdf",
  ".zip",
  ".tar.xz",
  ".rar",
  ".o",
  ".out",
  ".toc",
  ".aux",
  ".lock",
  ".png",
  ".gif",
  ".jpg",
}
opt.wildmode = "longest,full"

opt.swapfile = false -- Tbh swap file are disturbing af
opt.backup = false -- Disable backup file
opt.writebackup = false
opt.undofile = false
opt.autowriteall = true

-- configure path
opt.path:remove "/usr/include"
opt.path:append "**"

opt.wildignore:append "**/.git/*"
