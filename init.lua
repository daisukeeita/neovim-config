require("config.options")
require("config.autocmds")
require("config.keymaps")

require("plugins")
require("config.colorscheme")

require("bufferline").setup()
require("which-key").setup()

require("mini.ai").setup()
require("mini.pairs").setup()
require("mini.jump2d").setup()
require("mini.surround").setup()
require("mini.splitjoin").setup()
require("mini.indentscope").setup()

require("nvim-ts-autotag").setup()

require("mini.files").setup()
require("mason").setup()

require("nvim-navic").setup()
require("mini.diff").setup()
