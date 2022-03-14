--[[
 *******************************************************************
 Notes:


 *******************************************************************
--]]
local fn = vim.fn

-- Auto Install packer {{{2
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost load_plugs.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
-- packer.init {
--  display = {
--    open_fn = function()
--      return require("packer.util").float { border = "rounded" }
--    end,
--  },
-- }
-- }}}

-- ############################################################################
return packer.startup(function(use)
  use { "wbthomason/packer.nvim" }
	-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	-- UI and Related
	-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  -- Dependancy for plugin icons - may not need
	   -- use { "ryanoasis/vim-devicons" }
	use({ "ishan9299/nvim-solarized-lua", config = plugcfg("solarized") })

  -- Show #892312 in color
	use({ "norcalli/nvim-colorizer.lua", config = plugcfg("colorizer")})

	-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	-- Utils
	-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  use({ "nvim-lua/popup.nvim" })
  use({ "nvim-lua/plenary.nvim" })
  -- CursorLine only in active window
	use({ "vim-scripts/CursorLineCurrentWindow" })
  -- Fork of vim-devicons
	use({ "kyazdani42/nvim-web-devicons", config = plugcfg("web-devicons") })
  -- Wrapper for nterm
  use({ "kassio/neoterm",               config = plugcfg("neoterm") })
  -- Toggle window focus, then restore
	use({ "szw/vim-maximizer",            config = plugcfg("vim-maximizer") })
  -- Keep track of last edit site/file
	use({ "ethanholz/nvim-lastplace",     config = plugcfg("nvim-lastplace") })
  -- My Cheat sheet
  use({ "lifepillar/vim-cheat40",       config = plugcfg("cheat40") })
 -- Required for Telecope-frecency
	use({ "tami5/sqlite.lua" })

	-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	-- File, Buffer, Tags, Search and Related
	-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  -- Delete buffer not window
	use({ "moll/vim-bbye", config = plugcfg("bybbe") })
  -- Lua based status line
  use({ "hoob3rt/lualine.nvim", config = plugcfg("lualine") })
  -- Show buffers & quick switching
  use({ "akinsho/bufferline.nvim",     config = plugcfg("bufferline") })
  -- Intent lines visualy
	use({ "Yggdroot/indentLine",         config = plugcfg("indentline") })

	-- treesitter
	use({ "nvim-treesitter/nvim-tree-docs" })
	use({ "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
        config = plugcfg("treesitter") })

	use({ "nvim-treesitter/nvim-treesitter-refactor" })
	use({ "lewis6991/spellsitter.nvim", config = plugcfg("spellsitter") })

	-- telecope and friends
	use({ "nvim-telescope/telescope.nvim", config = plugcfg("telescope") })
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
  use { "nvim-telescope/telescope-file-browser.nvim" }

	use({ "nvim-telescope/telescope-frecency.nvim" })

	use({ "kyazdani42/nvim-tree.lua", config = plugcfg("nvimtree") })

	-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	-- Lsp, Snips, and Related
	-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  -- Installs language servers
  use({ "williamboman/nvim-lsp-installer" })
  -- Use the builtin Neovim Language Client
  use({ "neovim/nvim-lspconfig", config = plugcfg("lsp-config") })
  -- Create Lsp from local tooling, utils, other, and injects into Lsp flow
  use({ "jose-elias-alvarez/null-ls.nvim", config = plugcfg("null-ls") })

  -- Completion engine
  use({ "hrsh7th/nvim-cmp", config = plugcfg("cmp") })

	-- LSP source
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-nvim-lua")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-cmdline")
	use({ "hrsh7th/cmp-nvim-lsp-signature-help" })

  -- Snippet engine
	use({ "L3MON4D3/LuaSnip", config = plugcfg("luasnip") })
  -- LuaSnip completion source for cmp
	use({ "saadparwaiz1/cmp_luasnip" })
  -- Snippet source
  use({ "rafamadriz/friendly-snippets" })

	use { "f3fora/cmp-spell" }

  use { "onsails/lspkind-nvim" }

  use({ "lervag/vimtex", opt = true })

  use {
  "folke/trouble.nvim",
    config = function()
      require("trouble").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  }

	-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	-- Editing / Nav
	-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  -- Lua based bracket completion
  use { "windwp/nvim-autopairs", config = plugcfg("nvim-autopairs") }
  -- Edit "{( fast )}"
	use({ "tpope/vim-surround" })
  -- Comments by filetype
  use({ "tpope/vim-commentary" })
  -- Pairs color matching
  use({ "p00f/nvim-ts-rainbow" })

	use({ "justinmk/vim-sneak" })
	use("rhysd/clever-f.vim")
	use("jdhao/better-escape.vim")
	use("ntpeters/vim-better-whitespace")
  -- view and search LSP symbols and tags
  use( "liuchengxu/vista.vim" )
  use("ludovicchabant/vim-gutentags")
	require("nav-tools")
	-- ~/Dotfiles/nvim/lua/nav-tools.lua

  use({ "wellle/targets.vim" })

  -- Task running
	use({ "tpope/vim-dispatch" })
  -- Test runner
	use({ "vim-test/vim-test", config = plugcfg("vim-test") })
  -- Project help: I use .json to comfigure
	use({ "tpope/vim-projectionist" })


-- ############################################################################
  -- Set up your config - Place at end of packer's startup function
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
-- ############################################################################
end) -- End Packer.setup()
-- Eof
