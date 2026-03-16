return {
	{
		"folke/which-key.nvim",
		event = "VimEnter",
		opts = {
			delay = 100,
			icons = { mappings = vim.g.have_nerd_font },
			spec = {
				{ "<leader>s", group = "[S]earch", mode = { "n", "v" } },
			},
		},
	},
}
