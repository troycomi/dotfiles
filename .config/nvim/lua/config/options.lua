-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- pass health checks
vim.g.python3_host_prog = "/home/tcomi/.pyenv/versions/nvim_py/bin/python"
vim.g.loaded_perl_provider = 0

-- disable mouse
vim.opt.mouse = ""

-- disable comment on pressing enter
vim.cmd([[autocmd FileType * set formatoptions-=ro]])

-- use tmux clipboard
vim.opt.clipboard = ""

-- highlight column 79
vim.opt.colorcolumn = "79"

vim.opt.wildignorecase = true
vim.opt.wildignore = {
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
vim.opt.wildmode = "longest,full"
