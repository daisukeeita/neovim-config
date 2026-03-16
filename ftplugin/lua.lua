local capabilities = require("blink.cmp").get_lsp_capabilities()
local navic = require("nvim-navic")

vim.lsp.config("lua_ls", {
  capabilities = capabilities,
  on_attach = function(client, bufnr)
        navic.attach(client, bufnr)
  end,
  settings = {
		Lua = {
			runtime = { version = "LuaJIT" },
			diagnostics = { globals = { "vim" } },
      telemetry = { enable = false },
      workspace = {
        checkThirdParty = false,
        library = {
          vim.fn.stdpath("config")
        }
      },
			completion = {
				callSnippet = "Both",
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



vim.lsp.enable('lua_ls')
