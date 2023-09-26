return {
  {
    "tummetott/unimpaired.nvim",
    lazy = false,
    config = function()
      require("unimpaired").setup({
        keymaps = {
          blank_above = {
            mapping = "[<Space>",
            description = "Add [count] blank lines above",
            dot_repeat = true,
          },
          blank_below = {
            mapping = "]<Space>",
            description = "Add [count] blank lines below",
            dot_repeat = true,
          },
        },
        default_keymaps = false,
      })
    end,
  },
}
