require("which-key").setup({
	delay = 100,
	icons = { mappings = vim.g.have_nerd_font },
	spec = {
		{ "<leader>s", group = "[S]earch", mode = { "n", "v" } },
		{ "<leader>d", group = "[D]iagnostics", mode = { "n" } },
		{ "<leader>g", group = "[G]it", mode = { "n" } },
	},
})
