local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

local function button(sc, txt, keybind, keybind_opts)
  local b = dashboard.button(sc,txt,keybind,keybind_opts)
  b.opts.hl_shortcut = "Tag"
  b.opts.hl = "String"
  return b
end

dashboard.section.buttons.val = {
  button("i", "  New File", ":ene <BAR> startinsert <CR>"),
  button("p", "ﯙ  Projects", "<cmd>lua require'telescope'.extensions.project.project{}<cr>"),
  button("F", "  Find File   ", ":Telescope find_files<CR>"),
  button("t", "  Find Text   ", ":Telescope live_grep<CR>"),
  button("b", "  bash Config", ":e ~/.bashrc <CR>"),
  button("f", "  fish Config", ":e ~/.config/fish/config.fish <CR>"),
  button("v", "  Vim Config", ":e $MYVIMRC <CR>"),
  button("q", "  Quit Neovim", ":qa<CR>"),
}

dashboard.section.footer.val = os.date "%d-%m-%Y  %H:%M:%S"

dashboard.section.footer.opts.hl = "Constant"
dashboard.section.header.opts.hl = "Include"
dashboard.section.buttons.opts.hl = "Tag"
dashboard.section.buttons.opts.hl_shortcut = "Type"

alpha.setup(dashboard.opts)
