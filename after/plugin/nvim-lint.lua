require("lint").linters_by_ft = {
	java = { "checkstyle" },
	javascript = { "biome", "eslint_d" },
	javascriptreact = { "biome", "eslint_d" },
	typescript = { "biome", "eslint_d" },
	typescriptreact = { "biome", "eslint_d" },
}

require("lint").linters.checkstyle.args = {
	"-X",
	"ImportOrder,CustomImportOrder",
}
