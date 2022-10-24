local M = {}

function M.setup()
  local colors = require("gruvbox.palette")

  require("gruvbox").setup({
    undercurl = true,
    underline = true,
    bold = true,
    italic = true,
    strikethrough = true,
    invert_selection = false,
    invert_signs = false,
    invert_tabline = false,
    invert_intend_guides = false,
    inverse = true, -- invert background for search, diffs, statuslines and errors
    contrast = "hard", -- can be "hard", "soft" or empty string
    overrides = {
      SignColumn = { bg = colors.dark0_hard },
      FoldColumn = { bg = colors.dark0_hard },
      GruvboxRedSign = { fg = colors.red, bg = colors.dark0_hard, reverse = false },
      GruvboxGreenSign = { fg = colors.green, bg = colors.dark0_hard, reverse = false },
      GruvboxYellowSign = { fg = colors.yellow, bg = colors.dark0_hard, reverse = false },
      GruvboxBlueSign = { fg = colors.blue, bg = colors.dark0_hard, reverse = false },
      GruvboxPurpleSign = { fg = colors.purple, bg = colors.dark0_hard, reverse = false },
      GruvboxAquaSign = { fg = colors.aqua, bg = colors.dark0_hard, reverse = false },
      GruvboxOrangeSign = { fg = colors.orange, bg = colors.dark0_hard, reverse = false },
    },
  })

  vim.cmd("colorscheme gruvbox")
end

return M
