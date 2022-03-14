--
local ls = require("luasnip")
local types = require("luasnip.util.types")


ls.config.set_config({
	-- This tells LuaSnip to remember to keep around the last snippet.
	-- You can jump back into it even if you move outside of the selection.
	history = true,
	-- If you have synamic snippets, it will update as you type.
	updateevents = "TextChanged, TextChangedI",

	-- auto snippets
	enable_autosnippets = true,

	-- Highlights
	ext_opts = {
		[types.choiceNode] = {
			active = {
				virt_text = { { "<-", "Error" } },
			},
		},
	},
})

-- add snippets
require("luasnip.loaders.from_vscode").lazy_load()


-- <C-k> is the snippet expansion key and jump to the next node in the expanded snippet
vim.keymap.set({ "i", "s" }, "<C-k>", function()
	if ls.expand_or_jumpable() then
		ls.expand_or_jump()
	end
end, { silent = true })

-- <C-j> jump backwards in the expanded snippet
vim.keymap.set({ "i", "s" }, "<C-j>", function()
	if ls.jumpable(-1) then
		ls.jump(-1)
	end
end, { silent = true })

-- <C-l> selecting within a list of optons
vim.keymap.set("i", "<C-j>", function()
	if ls.choice_active() then
		ls.change_choice()
	end
end)

-- reload snippets without having to exit/restart nvim
-- vim.keymap.set("n", "<leader><leader>s", "<cmd>source ~/.config/nvim/lua/plugins/luasnip.lua<CR>")
-- ----------------------------------------------------------------------------
