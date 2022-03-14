
-- ------------------------------------------------------------------
  require'nvim-treesitter.configs'.setup {
    ensure_installed = "maintained",
    sync_install = false,
    ignore_install = {},
    autopairs = {enable = true},
    highlight = {
      enable = true,
      use_languagetree = true,
       disable = { "" },
       -- disable = { },
      additional_vim_regx_highlighting = true,
    },
    indent = {
      enable = true,
      disable = {"yaml"},
    },
    incremental_selection = {
       enable = true,
      keymaps = {
        -- init_selection = '<CR>',
        -- scope_incremental = '<CR>',
        -- node_incremental = '<TAB>',
        -- node_decremental = '<S-TAB>',
      },
     textobjects = { enable = true },
    },
    --- exteral modules
    refactor = {
      highlight_definitions = { enable = true },
      navigation = {
        enable = true,
        keymaps = {
          -- goto_definition = "gnd",
          -- list_definitions = "gnD",
          -- list_definitions_toc = "gO",
          -- goto_next_usage = "<a-*>",
          -- goto_previous_usage = "<a-#>",
        },
      },
  },
    rainbow = {
      enable = true,
      -- disable = { "jsx", "cpp" },
      extended_mode = true,
      max_file_lines = nil,
      -- colors = {},     -- table of hex strings
      -- termcolors = {}  -- table of colour name strings
    },
  }
