--
--
-- nnoremap("<silent><Leader>nt", ":NvimTreeToggle<CR>")

vim.cmd([[
  cnoreabbrev <silent> nt NvimTreeFindFileToggle
  cnoreabbrev <silent> ntt NvimTreeToggle
  cnoreabbrev <silent> ntr NvimTreeRefresh

  " nnoremap <leader>r :NvimTreeRefresh<CR>
  " nnoremap <leader>n :NvimTreeFindFile<CR>
]])

  local tree_cb = require'nvim-tree.config'.nvim_tree_callback
    --
require'nvim-tree'.setup {
    disable_netrw       = false,
    hijack_netrw        = true,
    open_on_setup       = false,
    ignore_buffer_on_setup = false,
    ignore_ft_on_setup  = {},
    auto_close          = true,
    auto_reload_on_write = true,
    open_on_tab         = false,
    hijack_cursor       = false,
    update_cwd          = true,
    hijack_unnamed_buffer_when_opening = false,

    update_to_buf_dir   = {
      enable = true,
      auto_open = true,
    },
    diagnostics = {
      enable = false,
      icons = {
        hint = "",
        info = "",
        warning = "",
        error = "",
      }
    },
    update_focused_file = {
      enable      = false,
      update_cwd  = true,
      ignore_list = {}
    },
    system_open = {
      cmd  = nil,
      args = {}
    },
    filters = {
      dotfiles = false,
      custom = {}
    },
    git = {
      enable = true,
      ignore = true,
      timeout = 500,
    },
    view = {
      width = 35,
      height = 30,
      hide_root_folder = true,
      side = 'left',
      auto_resize = true,
      mappings = {
        custom_only = false,
        list = {
         --  { key = { "l", "<CR>", "o" }, cb = tree_cb "edit" },
          -- { key = "h", cb = tree_cb "close_node" },
          { key = "v", cb = tree_cb "vsplit" },
        },
      },
      number = false,
      relativenumber = false
    },
    trash = {
      cmd = "trash",
      require_confirm = true
    }
  }
