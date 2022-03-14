--
vim.cmd([[
  command! LspLog :view ~/.cache/nvim/lsp.log
]])

-- Clean up how errors msgs are displayed
vim.diagnostic.config({ virtual_text = false })

-- Show line diagnostics automatically in hover window
vim.o.updatetime = 500
vim.cmd([[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]])

-- LSP autocomplete
vim.opt.completeopt = { "menu", "menuone", "noselect" }

vim.cmd([[
set shortmess+=c
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
]])

local lspconfig = require("lspconfig")
local capabilities = vim.lsp.protocol.make_client_capabilities()

capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

-- #####################################################################
local lsp_installer = require("nvim-lsp-installer")

local lsp_servers = {
	"bashls",
	"sumneko_lua",
	"elixirls",
	"remark_ls",
  "jsonls",
}

for _, name in pairs(lsp_servers) do
	local server_is_found, server = lsp_installer.get_server(name)
	if server_is_found then
		if not server:is_installed() then
			print("Installing " .. name)
			server:install()
		end
    server_is_found = nil
	end
end


-- ############################################################################
local on_attach = function(_, bufnr)

  local options = { buffer = bufnr, noremap = true, silent = true }
	-- local options = { noremap = true, silent = true }

	vim.keymap.set("n", "<Leader>lk", "<cmd>lua vim.lsp.buf.hover()<CR>", options)
	vim.keymap.set("n", "<Leader>lf", "<cmd>lua vim.lsp.buf.formatting()<CR>", options)
	vim.keymap.set("n", "<Leader>ld", "<cmd>lua vim.diagnostic.open_float(0, {scope='line', source=true})<CR>", options)
	vim.keymap.set("n", "<Leader>li", "<cmd>lua vim.lsp.buf.implementation()<CR>", options)
	vim.keymap.set("n", "<Leader>ll", "<cmd>lua vim.diagnostic.setloclist()<CR>", options)
	vim.keymap.set("n", "<Leader>ls", "<cmd>lua vim.lsp.buf.signature_help()<CR>", options)
	vim.keymap.set("n", "<Leader>lt", "<cmd>lua vim.lsp.buf.type_definition()<CR>", options)

	vim.keymap.set("n", "<Leader>l[", "<cmd>lua vim.diagnostic.goto_prev()<CR>", options)
	vim.keymap.set("n", "<Leader>l]", "<cmd>lua vim.diagnostic.goto_next()<CR>", options)

	vim.keymap.set("n", "<localleader>f", vim.lsp.buf.formatting, options)

	-- vim.keymap.set("n", "gd", "<Cmd>lua vim.diagnostic.open_float(0, {scope='line', source=true})<CR>", xoptions)
	-- vim.keymap.set("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", xoptions)
	-- vim.keymap.set("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", xoptions)
	-- vim.keymap.set("n", "xq", "<cmd>lua vim.diagnostic.setloclist()<CR>", xoptions)

	-- See `:help vim.lsp.*` for documentation on any of the below functions
	-- vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", xoptions)
	-- vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", xoptions)
	-- vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", xoptions)
	-- vim.keymap.set("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", xoptions)

	-- vim.keymap.set( "n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", xoptions)
	-- vim.keymap.set( "n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", xoptions)
	-- vim.keymap.set( "n", "<space>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", xoptions)
	-- vim.keymap.set( "n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", xoptions)
	-- vim.keymap.set( "n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", xoptions)
	-- vim.keymap.set( "n", "<space>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", xoptions)
	-- vim.keymap.set( "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", xoptions)
end

--[ Elixir ]----------------------------------------------------------------
local path_to_elixirls = vim.fn.expand("~/.local/share/nvim/lsp_servers/elixir/elixir-ls/language_server.sh")

lspconfig.elixirls.setup({
	cmd = { path_to_elixirls },
	capabilities = capabilities,
	on_attach = on_attach,
	flags = {
		debounce_text_changes = 150,
	},
	settings = {
		elixirLS = {
			-- I choose to disable dialyzer for personal reasons, but
			-- I would suggest you also disable it unless you are well
			-- aquainted with dialzyer and know how to use it.
			dialyzerEnabled = false,
			-- I also choose to turn off the auto dep fetching feature.
			-- It often get's into a weird state that requires deleting
			-- the .elixir_ls directory and restarting your editor.
			fetchDeps = false,
		},
	},
})

--
-- --[ Lua ]-------------------------------------------------------------------
local sumneko_binary_path = vim.fn.exepath(
	"/home/z1/.local/share/nvim/lsp_servers/sumneko_lua/extension/server/bin/lua-language-server"
)
local sumneko_root_path = vim.fn.fnamemodify(sumneko_binary_path, ":h:h")

-- print(sumneko_root_path)
-- print(sumneko_binary_path)

local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

require("lspconfig").sumneko_lua.setup({
	capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
	on_attach = on_attach,
	flags = {
		-- This will be the default in neovim 0.7+
		debounce_text_changes = 150,
	},
	--	cmd = { sumneko_binary_path, "-E", sumneko_root_path .. "/main.lua" },
	cmd = { sumneko_binary_path, "-E", sumneko_root_path .. "/main.lua" },
	settings = {
		Lua = {
			runtime = {
				-- Tell the language server which version of Lua you're
				-- using (most likely LuaJIT in the case of Neovim)
				version = "LuaJIT",
				-- version = 'Lua 5.1',

				path = runtime_path,
			},
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { "vim" },
				enable = true,
				-- globals = { "hs", "vim", "it", "describe", "before_each", "after_each" },
				disable = { "lowercase-global" },
			},
			workspace = {
				-- preloadFileSize = 400,
				-- Make the server aware of Neovim runtime files
				library = vim.api.nvim_get_runtime_file("", true),
			},
			-- Do not send telemetry data containing a randomized but unique identifier
			telemetry = {
				enable = false,
			},
		},
	},
})
--
-- ----------------------------------------------------------------------------
--
