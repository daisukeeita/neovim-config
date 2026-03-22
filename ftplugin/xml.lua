local capabilities = require("blink.cmp").get_lsp_capabilities()
local navic = require("nvim-navic")

vim.lsp.config("lemminx", {
	capabilities = capabilities,
	on_attach = function(client, bufnr)
		navic.attach(client, bufnr)
	end,
})

vim.lsp.enable("lemminx")
