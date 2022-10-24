local M = {}

function M.setup()
  -- Configuration
  require('Navigator').setup()

  -- Keybindings
  vim.keymap.set('n', "<A-h>", '<CMD>NavigatorLeft<CR>')
  vim.keymap.set('n', "<A-l>", '<CMD>NavigatorRight<CR>')
  vim.keymap.set('n', "<A-k>", '<CMD>NavigatorUp<CR>')
  vim.keymap.set('n', "<A-j>", '<CMD>NavigatorDown<CR>')

  vim.keymap.set('i', '<A-h>', '<ESC><CMD>NavigatorLeft<CR>')
  vim.keymap.set('i', '<A-l>', '<ESC><CMD>NavigatorRight<CR>')
  vim.keymap.set('i', '<A-k>', '<ESC><CMD>NavigatorUp<CR>')
  vim.keymap.set('i', '<A-j>', '<ESC><CMD>NavigatorDown<CR>')
end

return M
