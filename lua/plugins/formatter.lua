return {
	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				lua = { "stylua" },
				java = { "google-java-format" },
			},
			format_on_save = {
				timout_ms = 500,
				lsp_format = "fallback",
			},
		},
	},
	{
		"mfussenegger/nvim-lint",
		config = function()
			require("lint").linters_by_ft = {
				java = { "checkstyle" },
			}
		end,
	},
}
