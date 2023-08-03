local M = {}

function M.setup()
  local whichkey = require "which-key"

  local conf = {
    plugins = {
      spelling = {
        enabled = true,
        suggestions = 20,
      },
    },
    window = {
      border = "single", -- none, single, double, shadow
      position = "bottom", -- bottom, top
    },
  }

  local keymaps_f = {
    name = "Find",
    f = { "<cmd>lua require('utils.finder').find_files()<cr>", "Files" },
    d = { "<cmd>lua require('utils.finder').find_dotfiles()<cr>", "Dotfiles" },
    b = { "<cmd>Telescope buffers<cr>", "Buffers" },
    o = { "<cmd>Telescope oldfiles<cr>", "Old Files" },
    g = { "<cmd>Telescope live_grep<cr>", "Live Grep" },
    c = { "<cmd>Telescope commands<cr>", "Commands" },
    r = { "<cmd>Telescope file_browser<cr>", "Browser" },
    w = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "Current Buffer" },
    e = { "<cmd>NvimTreeToggle<cr>", "Explorer" },
  }

  local keymaps_p = {
    name = "Project",
    l = { "<cmd>lua require'telescope'.extensions.project.project{}<cr>", "List" },
    s = { "<cmd>Telescope repo list<cr>", "Search" },
  }

  local opts = {
    mode = "n", -- Normal mode
    prefix = "<leader>",
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = false, -- use `nowait` when creating keymaps
  }

  local mappings = {
    ["w"] = { "<cmd>update!<CR>", "Save" },
    ["q"] = { "<cmd>q!<CR>", "Quit" },
    ["e"] = { "<cmd>NvimTreeToggle<CR>", "Explorer" },
    ["v"] = { "<cmd>edit $MYVIMRC<CR>", "Edit nvim config" },
    ["V"] = { "<cmd>source $MYVIMRC<CR>", "Source nvim config" },
    ["b"] = { "<cmd>edit ~/.bashrc<CR>", "Edit bashrc" },

    z = {
      name = "Packer",
      c = { "<cmd>PackerCompile<cr>", "Compile" },
      i = { "<cmd>PackerInstall<cr>", "Install" },
      s = { "<cmd>PackerSync<cr>", "Sync" },
      S = { "<cmd>PackerStatus<cr>", "Status" },
      u = { "<cmd>PackerUpdate<cr>", "Update" },
    },

    g = {
      name = "Git",
      s = { "TODO", "Status" },
    },

    m = {
      name = "Markdown Preview",
      s = { "<cmd>MarkdownPreview<CR>", "Start" },
      S = { "<cmd>MarkdownPreviewStop<CR>", "Stop" },
    },

    f = keymaps_f,
    p = keymaps_p,

  }

  whichkey.setup(conf)
  whichkey.register(mappings, opts)
end

return M
