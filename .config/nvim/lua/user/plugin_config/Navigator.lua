-- Configuration
require('Navigator').setup()

-- Keybindings
vim.keymap.set('n', "<A-h>", '<CMD>NavigatorLeft<CR>')
vim.keymap.set('n', "<A-l>", '<CMD>NavigatorRight<CR>')
vim.keymap.set('n', "<A-k>", '<CMD>NavigatorUp<CR>')
vim.keymap.set('n', "<A-j>", '<CMD>NavigatorDown<CR>')

vim.api.nvim_set_keymap('i', '<A-h>', '<ESC><CMD>NavigatorLeft<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<A-l>', '<ESC><CMD>NavigatorRight<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<A-k>', '<ESC><CMD>NavigatorUp<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<A-j>', '<ESC><CMD>NavigatorDown<CR>', { noremap = true, silent = true })

