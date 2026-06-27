require("blink-cmp").setup({
	snippets = { preset = "luasnip" },

	appearance = { nerd_font_variant = "mono" },

	signature = {
		enabled = true,
		window = { border = "single" },
	},

	sources = {
		default = { "lsp", "path", "snippets", "buffer", "cmdline" },
	},

	completion = {
		documentation = {
			auto_show = true,
			window = { border = "single" },
		},

		menu = {
			draw = {
				columns = {
					{ "kind_icon", gap = 1 },
					{ "label", "label_description", gap = 1 },
					{ "kind", gap = 1 },
					{ "source_name" },
				},
				treesitter = { "lsp" },
			},
			border = "single",
		},
	},
})

require("luasnip.loaders.from_vscode").lazy_load()
