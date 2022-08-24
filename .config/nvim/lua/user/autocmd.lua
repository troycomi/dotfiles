local sync_packer = function()
  vim.cmd("runtime lua/user/plugins.lua")
  require("packer").sync()
end

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  pattern = { "plugins.lua" },
  callback = sync_packer,
})

