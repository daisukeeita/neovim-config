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
}
