local M = {}

function M.setup()
  -- Configuration
  require('Navigator').setup()

  -- Keybindings
  vim.keymap.set('n', '<A-h>', '<CMD>NavigatorLeft<CR>')
  vim.keymap.set('n', '<A-l>', '<CMD>NavigatorRight<CR>')
  vim.keymap.set('n', '<A-k>', '<CMD>NavigatorUp<CR>')
  vim.keymap.set('n', '<A-j>', '<CMD>NavigatorDown<CR>')

  vim.keymap.set('i', '<A-h>', '<ESC><CMD>NavigatorLeft<CR>')
  vim.keymap.set('i', '<A-l>', '<ESC><CMD>NavigatorRight<CR>')
  vim.keymap.set('i', '<A-k>', '<ESC><CMD>NavigatorUp<CR>')
  vim.keymap.set('i', '<A-j>', '<ESC><CMD>NavigatorDown<CR>')

  -- alt + t opens the window in a new tab
  vim.keymap.set('n', '<A-t>', '<CMD>tabe %<CR>')
  vim.keymap.set('i', '<A-t>', '<ESC><CMD>tabe %<CR>')

  -- alt + s makes a horizontal split
  vim.keymap.set('n', '<A-s>', '<C-w>s')
  vim.keymap.set('i', '<A-s>', '<ESC><C-w>s')

  -- alt + v makes a vertical split
  vim.keymap.set('n', '<A-v>', '<C-w>v')
  vim.keymap.set('i', '<A-v>', '<ESC><C-w>v')
end

return M
