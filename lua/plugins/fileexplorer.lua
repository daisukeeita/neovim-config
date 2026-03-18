return {
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		lazy = false,
		opts = {
			renderer = {
				group_empty = true,
			},
			update_focused_file = {
				enable = true,
				update_root = {
					enable = true,
				},
			},
			view = {
				width = {
					max = -1,
				},
			},
		},
	},
}
