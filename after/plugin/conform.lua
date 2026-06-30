require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		xml = { "xmlformatter" },
		css = { "prettier" },
		javascript = { "prettier" },
		javascriptreact = { "prettier" },
		typescript = { "prettier" },
		typescriptreacct = { "prettier" },
	},

	format_on_save = {
		timeout_ms = 500,
		lsp_format = "fallback",
	},
})
