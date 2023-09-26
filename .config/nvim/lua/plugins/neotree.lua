return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = {
      "s1n7ax/nvim-window-picker",
      event = "VeryLazy",
      opts = {},
    },
    opts = {
      window = {
        mappings = {
          ["C-s"] = "split_with_window_picker",
          ["C-v"] = "vsplit_with_window_picker",
          ["s"] = "split_with_window_picker",
          ["S"] = "vsplit_with_window_picker",
        },
      },
    },
  },
}
