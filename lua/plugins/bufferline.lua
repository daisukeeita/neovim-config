return {
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = "nvim-tree/nvim-web-devicons",
		config = function()
			require("bufferline").setup({
				highlights = {
					background = { attribute = "bg", higlight = "TabLine" },
					buffer_selected = {
						bold = true,
						italic = false,
					},
				},
			})
		end,
	},
}
