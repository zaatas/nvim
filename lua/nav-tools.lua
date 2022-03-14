--
vim.cmd([[
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
let g:clever_f_smart_case = 1
let g:clever_f_fix_key_direction = 1
let g:clever_f_show_prompt = 0
let g:clever_f_mark_char = 1
let g:clever_f_mark_char_color   = 'Cursor'
let g:clever_f_mark_cursor_color = 'Cursor'
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
let g:sneak#label = 1
let g:sneak#use_ic_scs = 1

nmap s <Plug>SneakLabel_s
nmap S <Plug>SneakLabel_S

" nmap <leader>s <Plug>Sneak_f

" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
let g:better_escape_shortcut = 'fd'
let g:better_escape_interval = 130
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
let g:strip_whitelines_at_eof    = 1
let g:better_whitespace_enabled  = 1
let g:strip_whitespace_on_save   = 1
let g:strip_whitespace_confirm   = 0
let g:better_whitespace_guicolor = '#073642'
"    -- vim.cmd("let g:better_whitespace_ctermcolor='#073642'
let g:better_whitespace_filetypes_blacklist=['diff','gitcommit','qf','help','markdown']
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 let g:gutentags_enabled = 1
 let g:gutentags_project_root = [".git", "mix.exs"]
]])

return function()
  -- https://www.reddit.com/r/vim/comments/d77t6j/guide_how_to_setup_ctags_with_gutentags_properly/
  vim.g.gutentags_ctags_exclude = {
        '*.git', '*.svg', '*.hg',
        '*/tests/*',
        'build',
        'dist',
        '*sites/*/files/*',
        'bin',
        'node_modules',
        'bower_components',
        'cache',
        'compiled',
        'docs',
        'example',
        'bundle',
        'vendor',
        '*.md',
        '*-lock.json',
        '*.lock',
        '*bundle*.js',
        '*build*.js',
        '.*rc*',
        '*.json',
        '*.min.*',
        '*.map',
        '*.bak',
        '*.zip',
        '*.pyc',
        '*.class',
        '*.sln',
        '*.Master',
        '*.csproj',
        '*.tmp',
        '*.csproj.user',
        '*.cache',
        '*.pdb',
        'tags*',
        'cscope.*',
        -- '*.css',
        -- '*.less',
        -- '*.scss',
        '*.exe', '*.dll',
        '*.mp3', '*.ogg', '*.flac',
        '*.swp', '*.swo',
        '*.bmp', '*.gif', '*.ico', '*.jpg', '*.png',
        '*.rar', '*.zip', '*.tar', '*.tar.gz', '*.tar.xz', '*.tar.bz2',
        '*.pdf', '*.doc', '*.docx', '*.ppt', '*.pptx',
        }

  vim.g.gutentags_add_default_project_roots = false
  vim.g.gutentags_project_root = {'package.json', '.git', 'mix.exs'}
  vim.g.gutentags_cache_dir = vim.fn.expand('~/.cache/nvim/ctags/')
  vim.g.gutentags_generate_on_new = true
  vim.g.gutentags_generate_on_missing = true
  vim.g.gutentags_generate_on_write = true
  vim.g.gutentags_generate_on_empty_buffer = true
  vim.cmd([[command! -nargs=0 GutentagsClearCache call system('rm ' . g:gutentags_cache_dir . '/*')]])
  vim.g.gutentags_ctags_extra_args = {'--tag-relative=yes', '--fields=+ailmnS', }
--
end
--
