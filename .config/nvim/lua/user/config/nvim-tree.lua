local M = {}
function M.setup()
  require("nvim-tree").setup({
    disable_netrw = false,
    hijack_netrw = false,
    respect_buf_cwd = false,
    view = {
      number = true,
      relativenumber = true,
      mappings = {
        list = {
          { key = "u", action = "dir_up" },
          { key = "<C-s>", action = "split" },
        },
      },
    },
    renderer = {
      group_empty = true,
      icons = {
        glyphs = {
          git = {
            unstaged = "",
          }
        }
      },
    },
    filters = {
      dotfiles = true,
      custom = { ".git" },
    },
    sync_root_with_cwd = false,
    update_focused_file = {
      enable = true,
      update_root = false,
    },
  })

  -- auto close
  vim.api.nvim_create_autocmd('BufEnter', {
    command = "if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif",
    nested = true,
  })

end
return M
