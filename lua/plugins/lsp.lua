return {
	{ "neovim/nvim-lspconfig" },
	{ "mason-org/mason.nvim", opts = {} },
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {},
		dependencies = {
			"neovim/nvim-lspconfig",
		},
	},

	{ "mfussenegger/nvim-jdtls" },

	{ "SmiteshP/nvim-navic" },

	{
		"folke/lazydev.nvim",
		ft = "lua", -- only load on lua files
		opts = {
			library = {
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			},
		},
	},
}
