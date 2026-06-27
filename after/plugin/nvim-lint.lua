require("lint").linters_by_ft = {
	java = { "checkstyle" },
	javascript = { "biome" },
	javascriptreact = { "biome" },
	typescript = { "biome" },
	typescriptreact = { "biome" },
}

require("lint").linters.checkstyle.args = {
	"-X",
	"ImportOrder,CustomImportOrder",
}
