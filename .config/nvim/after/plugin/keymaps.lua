local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- NORMAL --
-- cycle tabs with tab
keymap("n", "<Tab>", "gt", opts)
keymap("n", "<S-Tab>", "gT", opts)

-- center search results
keymap("n", "n", "nzz", opts)
keymap("n", "N", "Nzz", opts)
keymap("n", "<C-d>", "<C-d>zz", opts)
keymap("n", "<C-u>", "<C-u>zz", opts)

-- prepend searches with very magic (slow with keymap?)
vim.cmd([[nnoremap / /\v]])
vim.cmd([[nnoremap ? ?\v]])

-- Resizing panes
keymap("n", "<Left>", ":vertical resize -1<CR>", opts)
keymap("n", "<Right>", ":vertical resize +1<CR>", opts)
keymap("n", "<Up>", ":resize -1<CR>", opts)
keymap("n", "<Down>", ":resize +1<CR>", opts)

-- VISUAL --
-- keep copy register with leader paste
keymap("v", "<leader>p", [["_dP]], opts)

-- COMMAND --
-- replace %% with current directory
keymap("c", "%%", [[getcmdtype() == ':' ? expand('%:h').'/' : '%%']], {noremap = true, expr = true})
