--
local M = {}

function M.tscope()
	local tele = require("telescope")
	local ta = require("telescope.actions")
	-- -----------------------------------------------------------------------------
  tele.setup = {
		set_env = { ["COLORTERM"] = "truecolor" },
		color_devicons = true,
		use_less = true,
    --
    defaults = {
      mappings = {
        i = {
          ["<esc>"] = ta.close
        },
      },


		},
    extensions = {
      frecency = {

      },
      file_browser = {
        theme = "ivy",
        mappings = {
          ["i"] = {
            -- your custom insert mode mappings
          },
          ["n"] = {
            -- your custom normal mode mappings
          },
        },
      },
  },
}

	-- Telescope plugins
	tele.load_extension("frecency")
  tele.load_extension("file_browser")

  -- -----------------------------------------------------------------------------
	local options = {noremap = true, silent = true }

  vim.keymap.set("n", "<Leader>fb", "<cmd>lua require('telescope.builtin').buffers()<CR>", options)
  vim.keymap.set("n", "<Leader>fB", "<cmd>lua require('telescope').extensions.file_browser.file_browser()<CR>", options)
  vim.keymap.set("n", "<Leader>fc", "<cmd>lua require('telescope.builtin').command_history()<CR>", options)
  vim.keymap.set("n", "<Leader>ff", "<cmd>lua require('telescope.builtin').find_files()<CR>", options)
  vim.keymap.set("n", "<Leader>fg", "<cmd>lua require('telescope.builtin').live_grep k()<CR>", options)
  vim.keymap.set("n", "<Leader>fh", "<cmd>lua require('telescope.builtin').help_tags()<CR>", options)
  vim.keymap.set("n", "<Leader>fr", "<cmd>lua require('telescope.builtin').oldfiles()<CR>", options)
  vim.keymap.set("n", "<Leader>fR", "<cmd>lua require('telescope.builtin').registers()<CR>", options)
  vim.keymap.set("n", "<Leader>fn", "<cmd>vnew<CR>", options)
  vim.keymap.set("n", "<Leader>fq", "<cmd>lua require('telescope.builtin').quickfix()<CR>", options)
  vim.keymap.set("n", "<Leader>ft", "<cmd>lua require('telescope.builtin').current_buffer_tags()<CR>", options)
  vim.keymap.set("n", "<Leader>fT", "<cmd>lua require('telescope.builtin').tags()<CR>", options)

	vim.cmd([[
    " command Reg Telescope registers
    cnoreabbrev reg Telescope registers
  ]])
end

M.tscope()
return M
--
