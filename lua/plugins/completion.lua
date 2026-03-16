return {
	{
		"saghen/blink.cmp",
		dependencies = {
			"L3MON4D3/LuaSnip",
			"onsails/lspkind.nvim",
		},
		version = "1.*",
		opts = {
			snippets = { preset = "luasnip" },

			keymap = { preset = "default" },
			appearance = {
				nerd_font_variant = "mono",
			},
			completion = {
				documentation = {
					auto_show = true,
					window = { border = "single" },
				},
				menu = {
					draw = {
						components = {
							kind_icon = {
								text = function(ctx)
									local icon = ctx.kind_icon
									if vim.tbl_contains({ "Path" }, ctx.source_name) then
										local dev_icon, _ = require("nvim-web-devicons").get_icon(ctx.label)
										if dev_icon then
											icon = dev_icon
										end
									else
										icon = require("lspkind").symbol_map[ctx.kind] or ""
									end

									return icon .. ctx.icon_gap
								end,

								highlight = function(ctx)
									local hl = ctx.kind_hl
									if vim.tbl_contains({ "Path" }, ctx.source_name) then
										local dev_icon, dev_hl = require("nvim-web-devicons").get_icon(ctx.label)
										if dev_icon then
											hl = dev_hl
										end
									end
									return hl
								end,
							},
						},
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
			signature = { window = { border = "single" } },
			sources = {
				default = { "lazydev", "lsp", "path", "snippets", "buffer" },
				providers = {
					lazydev = {
						name = "LazyDev",
						module = "lazydev.integrations.blink",
						score_offset = 100,
					},
				},
			},
		},
	},
	{
		"L3MON4D3/LuaSnip",
		dependencies = { "rafamadriz/friendly-snippets" },
		version = "v2.*",
		config = function()
			require("luasnip.loaders.from_vscode").lazy_load()
		end,
	},
}
