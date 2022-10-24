local M = {}

function M.setup()
  require('lualine').setup {
    options =  {
      theme = 'gruvbox',
      disabled_filetypes = {'alpha'},
    },
    tabline = {},
    extensions = { 'nvim-tree' },
  }
end

return M
