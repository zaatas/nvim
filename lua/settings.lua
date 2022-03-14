-- Settings.lua

-- ---------------------------------------------------------
-- Disable the following nvim builtins
-- ---------------------------------------------------------
local disabled_built_ins = {
 --   "netrw",
 --   "netrwPlugin",
 --   "netrwSettings",
 --   "netrwFileHandlers",
    "gzip",
    "zip",
    "zipPlugin",
    "tar",
    "tarPlugin",
    "getscript",
    "getscriptPlugin",
    "vimball",
    "vimballPlugin",
    "2html_plugin",
    "logipat",
    "rrhelper",
    "spellfile_plugin",
    "matchit"
}

for _, plugin in pairs(disabled_built_ins) do
    vim.g["loaded_" .. plugin] = 1
end

-- ---------------------------------------------------------
-- Genteral
-- ---------------------------------------------------------
vim.opt.title = true

vim.g.mapleader = " "             -- change leader to a space
vim.g.maplocalleader = ","        -- change leader to a comma
vim.g.vimsyn_embed = "l"          -- Lua syntax highlighting

vim.opt.mouse = 'a'               -- enable mouse support
vim.opt.clipboard = 'unnamedplus' -- copy/paste to system clipboard
vim.opt.swapfile = false          -- don't use swapfile

-- ---------------------------------------------------------
-- Memory, CPU
-----------------------------------------------------------
vim.opt.hidden = true         -- enable background buffers
vim.opt.history = 1000        -- remember n lines in history
vim.opt.lazyredraw = true     -- faster scrolling
vim.opt.synmaxcol = 240       -- max column for syntax highlight

-- ---------------------------------------------------------
-- Neovim UI
-----------------------------------------------------------
vim.opt.number = true             -- show line number
vim.opt.relativenumber = true
vim.opt.showmatch = true          -- highlight matching parenthesis
vim.opt.foldmethod = 'marker'     -- enable folding (default 'foldmarker')
vim.opt.colorcolumn = '80'        -- line lenght marker at 80 columns
vim.opt.splitright = true         -- vertical split to the right
vim.opt.splitbelow = true         -- orizontal split to the bottom
vim.opt.ignorecase = true         -- ignore case letters when search
vim.opt.smartcase = true          -- ignore lowercase for the whole pattern
vim.opt.linebreak = true          -- wrap on word boundary
vim.opt.termguicolors = true
-- vim.opt.wrap = false
vim.opt.scrolloff = 3
vim.opt.cmdheight = 2

-----------------------------------------------------------
-- Tabs, indent
-----------------------------------------------------------
vim.opt.expandtab = true      -- use spaces instead of tabs
vim.opt.shiftwidth = 4        -- shift 4 spaces when tab
vim.opt.tabstop = 4           -- 1 tab == 4 spaces
vim.opt.softtabstop = 4
vim.opt.smartindent = true    -- autoindent new lines
vim.opt.autoindent = true
vim.opt.expandtab = true

-----------------------------------------------------------
-- insert mode completion options
-----------------------------------------------------------
vim.opt.completeopt = 'menu,menuone,noselect'


-- window-local options
vim.opt.signcolumn = 'yes'
vim.opt.cursorline = true

vim.wo.foldmethod   = 'marker'
vim.opt.foldlevel   = 0
vim.opt.foldnestmax = 10


vim.opt.timeoutlen = 1000
-- vim.opt.updatetime = 300
-- vim.opt.inccommand = "split"
-- vim.opt.breakindent = true
-- vim.opt.ignorecase = true
-- vim.opt.laststatus = 2
-- vim.opt.hlsearch = true
-- vim.opt.incsearch = true
-- vim.opt.syntax = 'on'
-- vim.opt.errorbells = false
-- vim.opt.smartcase = true
-- vim.opt.showmode = false
-- vim.opt.swapfile = true
-- vim.opt.dir = '/tmp'
-- vim.opt.backup = false
-- vim.opt.undodir = vim.fn.stdpath('config') .. '/undodir'
-- vim.opt.undofile = true

-- buffer-local options
-- vim.opt.swapfile = false

vim.cmd([[

set foldtext=NeatFoldText()
hi Folded term=NONE cterm=NONE ctermfg=6
cnoreabbrev Foldon set foldenable!


set expandtab smarttab shiftround autoindent smartindent smartcase
set path+=**
set wildmode=longest,list,full
" set wildmode=longest,full
set wildmenu
set wildignore+=**/node_modules/*
set wildignore+=**/.git/*
]])
