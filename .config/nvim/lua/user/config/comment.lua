local M = {}

function M.setup()
  require('Comment').setup(
    {
      ignore='^$',  -- blank lines
    }
  )

  local ft = require('Comment.ft')
  ft.snakemake = '# %s'
end

return M
