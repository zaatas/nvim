
 vim.cmd([[
   let g:maximizer_set_default_mapping = 1
   let g:maximizer_set_mapping_with_bang = 1
   let g:maximizer_default_mapping_key = '<C-w>o'
   let g:maximizer_restore_on_winleave = 1

   " Below are the defaults
   nnoremap <silent><C-w>o :MaximizerToggle<CR>
   " vnoremap <silent><F3> :MaximizerToggle<CR>gv
   " inoremap <silent><F3> <C-o>:MaximizerToggle<CR>
 ]])
