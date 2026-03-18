--local builtin = require("telescope.builtin")
local map = function(mode, lhs, rhs, desc)
	vim.keymap.set(mode, lhs, rhs, { noremap = true, silent = true, desc = desc or nil })
end

local telescope_map = function(mode, lhs, rhs, desc)
	map(mode, lhs, function()
		require("telescope.builtin")[rhs]()
	end, desc)
end

local lsp_map = function(mode, lhs, rhs, buf, desc)
	vim.keymap.set(mode, lhs, function()
		require("telescope.builtin")[rhs]()
	end, { buffer = buf, desc = desc })
end

vim.g.mapleader = " "

-----------------------------------------------------------------
---                         HIGHLIGHT                         ---
-----------------------------------------------------------------
map("n", "<Esc>", ":nohlsearch<CR>", "Clear highlight search")

-----------------------------------------------------------------
---                          YANKING                          ---
-----------------------------------------------------------------
map({ "n", "v" }, "<leader>y", '"+y', "Copy to clipboard")

-----------------------------------------------------------------
---                           GIT                             ---
-----------------------------------------------------------------
map("n", "<leader>gg", ":LazyGit<CR>", "Open LazyGit")

-----------------------------------------------------------------
---                        NAVIGATION                         ---
-----------------------------------------------------------------
--- Buffer Navigation
map("n", "<C-d>", "<C-d>zz", "Center after half-page down")
map("n", "<C-u>", "<C-u>zz", "Center after half-page up")
map("n", "n", "nzzzv", "Center during search next")
map("n", "N", "Nzzzv", "Center during search prev")

-- Line Navigation
map("v", "J", ":m '>+1<CR>gv=gv", "Move selected block down")
map("v", "K", ":m '<-2<CR>gv=gv", "Move selected block up")

-- Pane Navigation
map("n", "<C-h>", "<C-w>h", "Move to left split")
map("n", "<C-j>", "<C-w>j", "Move to bottom split")
map("n", "<C-k>", "<C-w>k", "Move to top split")
map("n", "<C-l>", "<C-w>l", "Move to right split")

-----------------------------------------------------------------
---                   PANE MANIPULATION                       ---
-----------------------------------------------------------------
-- Split Panes
map("n", "<leader>|", "<cmd>vsplit<CR>", "Vertical Split")
map("n", "<leader>_", "<cmd>split<CR>", "Horizontal Split")

-- Resize Panes
map("n", "<C-left>", "<cmd>vertical resize -4<CR>", "Decreasing the width of the pane")
map("n", "<C-right>", "<cmd>vertical resize +4<CR>", "Increasing the width of the pane")
map("n", "<C-up>", "<cmd>resize +4<CR>", "Increasing the height of the pane")
map("n", "<C-down>", "<cmd>resize -4<CR>", "Decreasing the height of the pane")

-----------------------------------------------------------------
---                    FILE EXPLORATION                       ---
-----------------------------------------------------------------
map("n", "<leader>e", ":NvimTreeToggle<cr>", "Toggle File Explorer")

-----------------------------------------------------------------
---                   BUFFER NAVIGATION                       ---
-----------------------------------------------------------------
map("n", "<S-h>", ":bprevious<CR>", "Go to previous buffer")
map("n", "<S-l>", ":bnext<CR>", "Go to next buffer")
map("n", "<leader>bd", ":bp|bd #<CR>", "Delete a buffer")

-----------------------------------------------------------------
---                      DIAGNOSTICS                          ---
-----------------------------------------------------------------
map("n", "<leader>dd", ":lua vim.diagnostic.open_float()<CR>", "Open [D]iagnostic [D]escription")
map("n", "<leader>dq", ":lua vim.diagnostic.setloclist()<CR>", "Open [D]iagnostics [Q]uickfix List")

-----------------------------------------------------------------
---                        SEARCH                             ---
-----------------------------------------------------------------
telescope_map("n", "<leader>sh", "help_tags", "[S]earch [H]elp")
telescope_map("n", "<leader>sk", "keymaps", "[S]earch [K]eymaps")
telescope_map("n", "<leader>sf", "find_files", "[S]earch [F]iles")
telescope_map("n", "<leader>ss", "builtin", "[S]earch [S]elect Telescope")
telescope_map({ "n", "v" }, "<leader>sw", "grep_string", "[S]earch Current [W]ord")
telescope_map("n", "<leader>sg", "live_grep", "[S]earch by [G]rep")
telescope_map("n", "<leader>sd", "diagnostics", "[S]earch [D]iagnostics")
telescope_map("n", "<leader>sr", "resume", "[S]earch [R]esume")
telescope_map("n", "<leader>s.", "oldfiles", "[S]earch Recent Files ('.' for repeat)")
telescope_map("n", "<leader>sc", "commands", "[S]earch Commands")
telescope_map("n", "<leader><leader>", "buffers", "[ ] Find Existing Buffers")

-----------------------------------------------------------------
---                        NAVIGATE LSP                       ---
-----------------------------------------------------------------
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("Telescope-LSP-Attach", { clear = true }),
	callback = function(event)
		local buf = event.buf
		lsp_map("n", "grr", "lsp_references", buf, "[G]o to [R]eferences")
		lsp_map("n", "gri", "lsp_implementations", buf, "[G]o to [I]mplementations")
		lsp_map("n", "grd", "lsp_definitions", buf, "[G]o to [D]efinitions")
		lsp_map("n", "gO", "lsp_document_symbols", buf, "[G]o to Document Symbols")
		lsp_map("n", "gW", "lsp_dynamic_workspace_symbols", buf, "[G]o to [W]orkspace Symbols")
		lsp_map("n", "grt", "lsp_type_definitions", buf, "[G]o to [T]ype Definitions")
		map({ "n", "x" }, "gra", ":lua vim.lsp.buf.code_action()<CR>", "[G]o to Code [A]ction")
		map("n", "grn", ":lua vim.lsp.buf.rename()<CR>", "[R]ename")
	end,
})
