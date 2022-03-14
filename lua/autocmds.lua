
-- Highlight on yank
 vim.cmd 'au TextYankPost * lua vim.highlight.on_yank {on_visual = false}'

vim.cmd([[
augroup auto_general
  autocmd!

  au VimEnter * set nospell
  au BufNewFile,BufRead *.md setlocal spell

  "keep cursor from jumping back when leaving insert mode
  au InsertLeave * call cursor([getpos('.')[1], getpos('.')[2]+1])

  " set cwd to dir of current buffer
  au BufEnter * silent! lcd %:p:h

  au BufEnter,FocusGained,InsertLeave * set relativenumber
  au BufLeave,FocusLost,InsertEnter   * set norelativenumber

  "---------------------------------------------------------
  au Filetype *.vim,*.viminfo set filetype=vim

  " Wipe all registers on start
  au VimEnter * command! Wipereg for i in range(34,122) | silent! call setreg(nr2char(i), []) | endfor

augroup END
]])


-- don't auto commenting new lines
vim.cmd [[au BufEnter * set fo-=c fo-=r fo-=o]]

-- remove line lenght marker for selected filetypes
vim.cmd [[autocmd FileType text,markdown,html,xhtml,javascript, elixir, lua setlocal cc=0]]

-- 2 spaces for selected filetypes
vim.cmd [[
  autocmd FileType xml,html,xhtml,css,scss,javascript,lua,elixir,yaml setlocal shiftwidth=2 tabstop=2
]]

vim.cmd [[

  autocmd TermOpen * setlocal listchars= nonumber norelativenumber nocursorline
  autocmd TermOpen * startinsert
  autocmd BufLeave term://* stopinsert
]]
