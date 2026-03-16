local opt = vim.opt

--CLIPBOARD--
vim.g.clipboard = "osc52"
--CLIPBOARD--

--COMPLETION--
opt.completeopt = { "menu", "menuone", "noinsert", "noselect" }
vim.bo.omnifunc = "v:lua.vim.lsp.omnifunc"
--COMPLETION--

--CURSOR LINE--
opt.cursorline = true
opt.updatetime = 250
--CURSOR LINE--

--GUI COLORS--
opt.termguicolors = true
vim.g.have_nerd_font = true
--GUI COLORS--

--INDENTING--
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.autoindent = true
opt.expandtab = true
opt.smartindent = true
opt.breakindent = true
--INDENTING--

--LINE NUMBERS--
opt.number = true
opt.relativenumber = true
opt.signcolumn = "yes"
--LINE NUMBERS--

--PREVIEW--
opt.inccommand = "split"
opt.confirm = true
--PREVIEW--

--SCROLLING--
opt.scrolloff = 8
opt.smoothscroll = true
--SCROLLING--

--SEARCH--
opt.ignorecase = true
opt.smartcase = true
--SEARCH--

--SPLITTING--
opt.splitright = true
opt.splitbelow = true
--SPLITTING--

--STATUS LINE--
opt.laststatus = 3
opt.showmode = false
opt.cmdheight = 1
--STATUS LINE--

--DIAGNOSTIC CONFIGURATION--
vim.diagnostic.config({
	underline = true,
	update_in_insert = false,
	severity_sort = true,
	virtual_text = false,
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = " ",
			[vim.diagnostic.severity.WARN] = " ",
			[vim.diagnostic.severity.INFO] = " ",
			[vim.diagnostic.severity.HINT] = " ",
		},
	},
	float = {
		scope = "cursor",
		border = "rounded",
		focusable = true,
		style = "minimal",
		source = "if_many",
		prefix = " ",
	},
})
--DIAGNOSTIC CONFIGURATION--

opt.mouse = ""
