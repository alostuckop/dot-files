local lsp_zero = require("lsp-zero")

lsp_zero.on_attach(function(client, bufnr)
	-- see :help lsp-zero-keybindings
	-- to learn the available actions
	lsp_zero.default_keymaps({ buffer = bufnr })
end)

require("mason").setup({})
require("mason-lspconfig").setup({
	ensure_installed = {
		"eslint",
		"jedi_language_server",
		"lua_ls",
		"pyright",
		"ts_ls",
	},
	handlers = {
		lsp_zero.default_setup,
	},
})
require("mason-null-ls").setup({
	ensure_installed = {
		"black",
		"eslint_d",
		"isort",
		"prettier",
		"stylua",
		"ts-standard",
	},
	automatic_installation = true,
})
