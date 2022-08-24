require("nvim-tree").setup({
  view = {
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
        { key = "<C-s>", action = "split" },
      },
    },
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})

-- open file explorer
vim.api.nvim_set_keymap("n", "<Leader>e", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
