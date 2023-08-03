local M = {}

function M.setup()
  local colors = require("gruvbox.palette")

  require("gruvbox").setup({
    undercurl = true,
    underline = true,
    bold = true,
    italic = {
     strings = false,
     operators = true,
     comments = true,
     folds = true,
    },
    strikethrough = true,
    invert_selection = false,
    invert_intend_guides = false,
    contrast = "hard", -- can be "hard", "soft" or empty string
    overrides = {
      SignColumn = { bg = "none" },
      FoldColumn = { bg = "none" },
    },
  })

  vim.cmd("colorscheme gruvbox")
end

return M
