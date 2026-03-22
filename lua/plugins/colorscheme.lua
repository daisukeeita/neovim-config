return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function() end,
		opts = {
			transparent_background = true,
			integrations = {
				neotree = true,
				treesitter = true,
				blink_cmp = { style = "bordered" },
			},
		},
	},
	{
		"sainnhe/everforest",
		lazy = false,
		priority = 1000,
		config = function()
			vim.g.everforest_background = "soft"
			vim.g.everforest_transparent_background = 2
			vim.g.everforest_better_performance = 1
			vim.g.everforest_enable_italic = 1
			vim.g.everforest_show_eob = 0
			vim.g.everforest_diagnostic_text_highlight = 0
			vim.g.everforest_diagnostic_line_highlight = 1

			vim.cmd.colorscheme("everforest")
		end,
	},
}
