local M = {}
function M.setup()
  require'colorizer'.setup(
    {'*'},
    {
      names    = false,        -- skip names like blue
      RGB      = true;         -- #008 hex codes
      RRGGBB   = true;         -- #008000 hex codes
    })
end

return M
