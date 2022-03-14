
  require'lualine'.setup({
    extensions = {'quickfix', 'nvim-tree'},
    tabline = {},
    options = {
      icons_enabled = true,
      -- theme = 'auto',
      theme = 'solarized_dark',
      component_separators = {left = '', right = ''},
      section_separators   = {left = '', right = ''},
      -- section_separators   = {left = '', right = ''},
      disabled_filetypes = {},
      always_divide_middle = true,
      },
      sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diagnostics'},
        lualine_c = {
          {
            'filename',
            path = 1,
            file_status = true,
            shorting_target=35,
          }
        },
        -- lualine_x = {'encoding', 'fileformat', 'filetype'},
        lualine_x = {'filetype'},
        lualine_y = {'progress'},
        lualine_z = {'location'}
      },

      inactive_sections = {
        lualine_a = {'filetype', 'filename'},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {}
      },
  })
