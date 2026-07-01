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

	settings = {
		typescript = {
			inlayHints = { parameterNames = { enabled = "literals" } },
			preferences = {
				importModuleSpecifier = "non-relative",
				importModuleSpecifierPreference = "non-relative",
				importModuleSpecifierEnding = "minimal",
				preferTypeOnlyAutoImports = false,
			},
		},
		javascript = {
			inlayHints = { parameterNames = { enabled = "literals" } },
			preferences = {
				importModuleSpecifier = "non-relative",
				importModuleSpecifierPreference = "non-relative",
			},
		},
		vtsls = {
			autoUseWorkspaceTsdk = true,
			experimental = {
				completion = {
					enableServerSideFuzzyMatch = true,
				},
			},
		},
	},
})

vim.lsp.enable("vtsls")

vim.lsp.enable("tailwindcss")
