--
local null_ls = require("null-ls")

-- register any number of sources simultaneously
local sources = {
	null_ls.builtins.formatting.stylua.with({
		filetypes = { "lua"},
	}),

	null_ls.builtins.formatting.prettier.with({
		filetypes = { "html", "json", "yaml", "markdown" },
	}),

	null_ls.builtins.completion.spell.with({
		filetypes = { "markdown", "txt" },
	}),

	null_ls.builtins.code_actions.gitsigns,

	-- null_ls.builtins.diagnostics.cspell,
	-- null_ls.builtins.formatting.mix,
	null_ls.builtins.diagnostics.credo,
}

null_ls.setup({
  cmd = { "/home/z1/.bin/nvim" },
  debounce = 250,
  debug = true,
  default_timeout = 5000,
  diagnostics_format = "#{m}",
  fallback_severity = vim.diagnostic.severity.ERROR,
  log = {
      enable = true,
      level = "warn",
      use_console = "async",
  },
  on_attach = nil,
  on_init = nil,
  on_exit = nil,
  -- root_dir = u.utils.root_pattern(".null-ls-root", "Makefile", ".git", "mix"),
	sources = sources,
  update_in_insert = false,

})
