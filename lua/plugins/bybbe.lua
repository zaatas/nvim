-- ------------------------------------------------------------------
--
vim.cmd([[
  command     Bx bufdo Bwipeout
  cnoreabbrev bx Bwipeout
  " nnoremap <Leader>bx :Bwipeout<CR>

  cnoreabbrev bxx  Bwipeout!
  " nnoremap <Leader>bk :Bwipeout!<CR>

  command     Bc :call SmartClose()
  cnoreabbrev bc Bc
]])

-- ------------------------------------------------------------------
