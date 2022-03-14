--
local cmp     = require("cmp")
local luasnip = require("luasnip")

-- If you want insert `(` after select function or method item
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
cmp.event:on( 'confirm_done', cmp_autopairs.on_confirm_done({  map_char = { tex = '' } }))

-- Configure the completion Engine
-- ----------------------------------------------------------------------------
vim.opt.spell = true
vim.opt.spelllang = { 'en_us' }

cmp.setup({
  confirm_opts = {
    behavior = cmp.ConfirmBehavior.Replace,
    select = false,
  },
  -- documentation = true,
  documentation = {
  	border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
  },
	completion = {
		keyword_length = 1,
	},
	-- confirmation = { default_behaviour = cmp.ConfirmBehavior.Replace },

	sources = cmp.config.sources({
		{ name = "nvim_lsp"},
		{ name = "nvim_lua"},   -- source nvim lua api's
		{ name = "luasnip"},
		{ name = "buffer"},
		{ name = "path" ,},
		{ name = "treesitter"},
		{ name = "sumneko_lua"},
		{ name = "nvim_lsp_signature_help"},
		{ name = "spell" },
    { max_item_count=9},
		-- { name = 'cmdline'},
  }),
	formatting = {
		format = require("lspkind").cmp_format({
		  with_text = true,
		 	menu = {
		 		luasnip = "[Snip]",
		 		nvim_lsp = "[Lsp]",
		 		buffer = "[Buf]",
		 		treesitter = "[Tree]",
		 		nvim_lua = "[Lua]",
		 		path = "[Path]",
		 	},
		}),
	},
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	mapping = {
		['<C-p>'] = cmp.mapping.select_prev_item(),
		['<C-n>'] = cmp.mapping.select_next_item(),

		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),

		["<C-Space>"] = cmp.mapping.complete(),
		["<C-c>"] = cmp.mapping.close(),
		["<CR>"] = cmp.mapping.confirm({ select = true }),
	},
})


-- cmdline setup.
cmp.setup.cmdline("/", {
	sources = {
		{ name = "buffer", max_item_count=9 },
	},
})

cmp.setup.cmdline(":", {
	sources = cmp.config.sources({
		{ name = "path", max_item_count=9 },
	},
  {
		{ name = "cmdline", max_item_count = 9 },
	}),
})
