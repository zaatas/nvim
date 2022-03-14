--
local opt = {noremap=true, silent=true}
-- ------------------------------------------------------------------
vim.keymap.set('n', ';', ':', {noremap=true})
 -----------------------------------------------------------------
-- Packer Commands
vim.cmd("command! PS PackerSync")
vim.cmd("command! PC PackerCompile")
vim.cmd("command! PU PackerUpdate")

-- nnoremap("<Leader>xx", "<cmd>lua ReloadConfig()<CR>")

vim.cmd([[
  command! ECheat edit ~/Dotfiles/nvim/cheat40.txt
  cnoreabbrev echeat ECheat
]])

-- Navigation
-- ------------------------------------------------------------------
  -- EOL BOL
  vim.keymap.set('n', 'H', '^', opt)
  vim.keymap.set('n', 'L', '$', opt)

  -- Nav in insert mode
  vim.keymap.set('i', '<C-h>', '<Left>',  opt)
  vim.keymap.set('i', '<C-l>', '<Right>', opt)

  -- gh Open vspit filename under the cursor
  vim.keymap.set('n', 'gh', ':vertical wincmd  f<CR>', opt)

  -- Last know position in active buffer
  vim.keymap.set('n', 'gl', '`.', opt)

  -- Last known buffer
  vim.keymap.set('n', 'gb', '<C-^>', opt)

  -- Nav terminal and normal splits
  vim.keymap.set({"n", "t"}, "<C-h>", "<C-\\><C-N><C-w>h", opt)
  vim.keymap.set({"n", "t"}, "<C-l>", "<C-\\><C-N><C-w>l", opt)
  vim.keymap.set({"n", "t"}, "<C-j>", "<C-\\><C-N><C-w>j", opt)
  vim.keymap.set({"n", "t"}, "<C-k>", "<C-\\><C-N><C-w>k", opt)

-- UI
-- ------------------------------------------------------------------
  vim.keymap.set("n", "<leader><CR>", "<cmd>:noh<CR>", opt)

  -- Alt hjkl keys to resize the windows
  vim.keymap.set('n', '<M-h>', ':vertical resize +1<CR>', { noremap = true, silent = true })
  vim.keymap.set('n', '<M-l>', ':vertical resize -1<CR>', { noremap = true, silent = true })
  vim.keymap.set('n', '<M-j>', ':resize -1<CR>', { noremap = true, silent = true })
  vim.keymap.set('n', '<M-k>', ':resize +1<CR>', { noremap = true, silent = true })

  -- If press h on head, fold close. zc
  vim.cmd("nnoremap <expr> h col('.') == 1 && foldlevel(line('.')) > 0 ? 'za'   : 'h'")
  vim.cmd("xnoremap <expr> h col('.') == 1 && foldlevel(line('.')) > 0 ? 'zagv' : 'h'")

  -- If press l or o on fold, fold open.
  vim.cmd("nnoremap <expr> o foldclosed(line('.')) != -1 ? 'zo0'   : 'l'")
  vim.cmd("xnoremap <expr> o foldclosed(line('.')) != -1 ? 'zogv0' : 'l'")

  -- center cursor on screen when paging
  vim.keymap.set({"n", "v"}, "<C-u>", "<C-u>zz", {noremap = true})
  vim.keymap.set({"n", "v"}, "<C-d>", "<C-d>zz", {noremap = true})
  vim.keymap.set({"n", "v"}, "<C-f>", "<C-f>zz", {noremap = true})
  vim.keymap.set({"n", "v"}, "<C-b>", "<C-b>zz", {noremap = true})

  -- when jump to next search/match also center screen
  vim.keymap.set({"n", "v"}, "n", "nzz", {noremap = true})
  vim.keymap.set({"n", "v"}, "N", "Nzz", {noremap = true})


-- Editing
-- ------------------------------------------------------------------
  -- Write and close window buffer - buffer remains in jump list
  vim.cmd("command! W silent update | silent Bwipeout")

  vim.keymap.set('n', '<leader>w', ':update<CR>', { noremap = true, silent = true })

  vim.keymap.set('n', '<C-w>c',    ':call SmartClose()<CR>', { noremap = true, silent = true })

-- Keep curson postion after joining
  vim.keymap.set('n', 'Jj', 'mzJ`z', { noremap = true, silent = true })

  -- Split line. Sister to J
  vim.keymap.set('n', 'Js','mzi<CR><Esc>`z', { noremap = true, silent = true })

  -- Insert n spaces at cursor n gi / 4 xi inserts 4 spaces
  vim.keymap.set('n', '<Leader>i', 'i<Space><Esc>', { noremap = true, silent = true })

  -- Make shift same a tab
  vim.keymap.set('n', '>', '>>_', { noremap = true, silent = true })
  vim.keymap.set('n', '<', '<<_', { noremap = true, silent = true })

  -- Visual -- Stay in indent mode
  vim.keymap.set("v", "<", "<gv", { noremap = true, silent = true })
  vim.keymap.set("v", ">", ">gv", { noremap = true, silent = true })

  -- Move text up and down
  vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", opt)
  vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", opt)

  vim.keymap.set({"x","v"}, "<A-j>", ":move '>+1<CR>gv-gv", opt)
  vim.keymap.set({"x","v"}, "<A-k>", ":move '<-2<CR>gv-gv", opt)

  -- Paste keep cursor position
  vim.keymap.set("n", "p", "p`[", opt)

  -- Yank to EOL
  vim.keymap.set("n", "Y", "y$", opt)

  -- After visual yank, put cursor at top of block
  vim.keymap.set('v', 'y', 'y`[', opt)

  -- Replace word with last yank
  vim.keymap.set('n', 'P', '\"_diwP', opt)

  -- Duplicate the current line and comment it
  vim.keymap.set('n', "<Leader>gc", "YI<Esc>p<cmd>Commentary<CR>", opt)

  -- Insert empty lines
  vim.keymap.set("n", "<C-k>", ":call AddEmptyLineAbove()<CR>", opt)
  vim.keymap.set("n", '<C-j>', ":call AddEmptyLineBelow()<CR>", opt)


--
