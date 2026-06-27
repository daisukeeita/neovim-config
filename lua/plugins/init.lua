local plugins = {}

vim.list_extend(plugins, require("plugins.ui"))
vim.list_extend(plugins, require("plugins.editor"))
vim.list_extend(plugins, require("plugins.navigation"))
vim.list_extend(plugins, require("plugins.lsp"))
vim.list_extend(plugins, require("plugins.completion"))
vim.list_extend(plugins, require("plugins.dap"))
vim.list_extend(plugins, require("plugins.git"))

vim.pack.add(plugins)
