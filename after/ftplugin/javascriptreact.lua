local capabilities = require("blink-cmp").get_lsp_capabilities()
local navic = require("nvim-navic")

local on_attach = function(client, bufnr)
	if client:supports_method("textDocument/inlayHint") then
		vim.lsp.inlay_hint.enable(true)
	end

	if client.server_capabilities.documentSymbolProvider then
		navic.attach(client, bufnr)
	end
end

vim.lsp.config("vtsls", {
	capabilities = capabilities,
	on_attach = on_attach,
})

vim.lsp.enable("vtsls")

vim.lsp.enable("tailwindcss")
