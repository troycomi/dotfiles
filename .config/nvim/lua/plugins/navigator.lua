return {
  {
    "numToStr/Navigator.nvim",
    lazy = true,
    config = function()
      require("Navigator").setup({})
    end,
    keys = {
      { "<C-h>", "<CMD>NavigatorLeft<CR>" },
      { "<C-l>", "<CMD>NavigatorRight<CR>" },
      { "<C-k>", "<CMD>NavigatorUp<CR>" },
      { "<C-j>", "<CMD>NavigatorDown<CR>" },
    },
  },
}
