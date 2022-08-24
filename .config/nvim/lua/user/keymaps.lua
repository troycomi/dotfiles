local keymap = vim.api.nvim_set_keymap
opts = { noremap = true, silent = true }

-- NORMAL --
-- shortcuts to common files
keymap("n", "<Leader>v", ":edit $MYVIMRC<CR>", opts)
keymap("n", "<Leader>V", ":source $MYVIMRC<CR>", opts)
keymap("n", "<Leader>b", ":edit ~/.bashrc<CR>", opts)

-- cycle tabs with tab
keymap("n", "<Tab>", "gt", opts)
keymap("n", "<S-Tab>", "gT", opts)

-- prepend searches with very magic (slow with keymap?)
vim.cmd([[nnoremap / /\v]])
vim.cmd([[nnoremap ? ?\v]])

-- VISUAL --
-- stay in visual mode during indent
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- keep copy register with paste
keymap("v", "p", [["_dP]], opts)

-- COMMAND --
-- replace %% with current directory
keymap("c", "%%", [[getcmdtype() == ':' ? expand('%:h').'/' : '%%']], {noremap = true, expr = true})
