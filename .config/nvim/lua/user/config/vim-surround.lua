local M = {}

function M.setup()
  -- set "d" as a command to convert object to python dictionary ['']
  vim.g.surround_100 = "['\r']"
end

return M
