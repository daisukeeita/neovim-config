vim.lsp.config("cssls", {
	capabilities = require("blink-cmp").get_lsp_capabilities(),

	on_attach = function(client, bufnr)
		require("nvim-navic").attach(client, bufnr)
	end,

	-- cmd = { "vscode-css-language-server", "--stdio" },
	-- filetypes = { "css", "scss", "less " },
	-- root_dir = vim.lsp.util.root_pattern("package.json", ".git"),
	-- single_file_support = true,
	--
	-- settings = {
	-- 	css = { validate = true },
	-- 	scss = { validate = true },
	-- 	less = { validate = true },
	-- },
})

vim.lsp.enable("cssls")
