-- ------------------------------------------------------------------
vim.opt.termguicolors = true

require("bufferline").setup {
  options = {
      -- numbers = "ordinal",
      -- number_style = "superscript",
      modified_icon = "●",
      ax_name_length = 18,
      -- separator_style = {"┆", "┆"},
      separator_style = {"|", "|"},
      always_show_bufferline = true,
  }
}

vim.keymap.set("n", "<C-p>", "<cmd>:bp<CR>", {silent = true})
vim.keymap.set("n", "<C-n>", "<cmd>:bn<CR>", {silent = true})
vim.keymap.set("n", "<C-g>", "<cmd>:BufferLinePick<CR>", {silent = true})

-- ------------------------------------------------------------------
