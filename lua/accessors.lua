

-- accessors
-- ------------------------------------------------------------------
local go = vim.o   -- global options
local bo = vim.bo  -- buffer options
local wo = vim.wo  -- window options

local g=vim.g     -- get or set global variables 
local env = vim.env   -- get or set environment variables

local fn   = vim.fn   -- to call Vim functions e.g. fn.bufnr()
local cmd  = vim.cmd  -- to execute Vim commands e.g. cmd('pwd')

local opt = vim.opt   -- to set options
local set = vim.opt   -- set global, buffer, or window optsion


--
