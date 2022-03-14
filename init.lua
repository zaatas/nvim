--[[
" Author            : Matthew Rockwell
" Inspired by       : VIM Community
" Initially created : 5/14/1998 (Emacs refugee)
" *******************************************************************
" Notes:
" Moved to Lua : March 12, 2022
"
" *******************************************************************
--]]

-- Tell Neovim where python is
vim.g.python3_host_prog = "/usr/bin/python3"

-- ~/Dotfiles/nvim/lua/settings.lua
require('settings')

-- ~/Dotfiles/nvim/lua/globals.lua
require('globals')


-- ~/Dotfiles/nvim/lua/keybindings.lua
require('keymaps')
-- ~/Dotfiles/nvim/lua/autocmds.lua
require('autocmds')

-- ~/Dotfiles/nvim/lua/helpers.lua
require('helpers')
-- ~/Dotfiles/nvim/lua/load_plugs.lua
require('load_plugs')

--
