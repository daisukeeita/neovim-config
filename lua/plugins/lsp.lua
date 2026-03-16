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

	{
		"SmiteshP/nvim-navic",
		config = function()
			require("nvim-navic").setup({
				icons = {
					File = "󰈙 ",
					Module = " ",
					Namespace = "󰌗 ",
					Package = " ",
					Class = "󰌗 ",
					Method = "󰆧 ",
					Property = " ",
					Field = " ",
					Constructor = " ",
					Enum = "󰕘 ",
					Interface = "󰕘 ",
					Function = "󰊕 ",
					Variable = "󰆦 ",
					Constant = "󰏿 ",
					String = "󰀬 ",
					Number = "󰎠 ",
					Boolean = "◩ ",
					Array = "󰅪 ",
					Object = "󰅩 ",
					Key = "󰌋 ",
					Null = "󰟢 ",
					EnumMember = " ",
					Struct = "󰌗 ",
					Event = " ",
					Operator = "󰆕 ",
					TypeParameter = "󰊄 ",
				},
				highlight = true, -- This makes the icons use your theme's colors
				separator = " > ",
				depth_limit = 0,
				depth_limit_indicator = "..",
				safe_output = true,
			})
		end,
	},

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
