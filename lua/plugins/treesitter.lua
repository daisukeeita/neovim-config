return {
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		build = ":TSUpdate",
		dependencies = {
			"nvim-treesitter/nvim-treesitter-context",
		},
		opts = {
			indent = { enable = true },
			highlight = { enable = true },
			folds = { enable = true },
		},
	},
}
