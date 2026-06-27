vim.lsp.config("lua_ls", {
	capabilities = require("blink-cmp").get_lsp_capabilities(),

	on_attach = function(client, bufnr)
		require("nvim-navic").attach(client, bufnr)
	end,

	settings = {
		Lua = {
			runtime = { version = "LuaJIT" },
			diagnostics = { globals = { "vim" } },
			telemetry = { enable = false },
			workspace = {
				checkThirdParty = false,
			},
			completion = {
				callSnippet = "Replace",
				keywordSnippet = "Both",
				workspaceWord = true,
			},
			hint = {
				enable = true,
				paramType = true,
				semicolon = false,
				setType = true,
				arrayIndex = false,
			},
		},
	},
})

vim.lsp.enable("lua_ls", true)
