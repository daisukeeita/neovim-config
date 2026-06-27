require("telescope").setup({
	defaults = {
		find_command = { "fdfind", "--type", "f", "--strip-cwd-prefix", "--hidden", "--exclude", ".git" },
	},
	extensions = {
		fzf = {
			fuzzy = true,
			override_generic_sorter = true,
			override_file_sorter = true,
			case_mode = "smart_case",
		},
	},
})

require("telescope").load_extension("fzf")

local map = function(mode, lhs, rhs, opts)
	opts = opts or {}

	local keymap_opts = {
		noremap = true,
		silent = true,
		desc = opts.desc,
		buffer = opts.buf,
	}

	if type(rhs) == "string" then
		vim.keymap.set(mode, lhs, function()
			require("telescope.builtin")[rhs]()
		end, keymap_opts)
	else
		vim.keymap.set(mode, lhs, rhs, keymap_opts)
	end
end

-----------------------------------------------------------------
---                        NAVIGATE LSP                       ---
-----------------------------------------------------------------
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("Telescope-LSP-Attach", { clear = true }),
	callback = function(event)
		local buf = event.buf
		map("n", "grr", "lsp_references", { buf = buf, desc = "[G]o to [R]eferences" })
		map("n", "gri", "lsp_implementations", { buf = buf, desc = "[G]o to [I]mplementations" })
		map("n", "grd", "lsp_definitions", { buf = buf, desc = "[G]o to [D]efinitions" })
		map("n", "gO", "lsp_document_symbols", { buf = buf, desc = "[G]o to Document Symbols" })
		map("n", "gW", "lsp_dynamic_workspace_symbols", { buf = buf, desc = "[G]o to [W]orkspace Symbols" })
		map("n", "grt", "lsp_type_definitions", { buf = buf, desc = "[G]o to [T]ype Definitions" })
		map({ "n", "x" }, "gra", vim.lsp.buf.code_action, { desc = "[G]o to Code [A]ction" })
		map("n", "grn", vim.lsp.buf.rename, { desc = "[R]ename" })
	end,
})

-----------------------------------------------------------------
---                        SEARCH                             ---
-----------------------------------------------------------------
map("n", "<leader>sh", "help_tags", { desc = "[S]earch [H]elp" })
map("n", "<leader>sk", "keymaps", { desc = "[S]earch [K]eymaps" })
map("n", "<leader>sf", "find_files", { desc = "[S]earch [F]iles" })
map("n", "<leader>ss", "builtin", { desc = "[S]earch [S]elect Telescope" })
map({ "n", "v" }, "<leader>sw", "grep_string", { desc = "[S]earch Current [W]ord" })
map("n", "<leader>sg", "live_grep", { desc = "[S]earch by [G]rep" })
map("n", "<leader>sd", "diagnostics", { desc = "[S]earch [D]iagnostics" })
map("n", "<leader>sr", "resume", { desc = "[S]earch [R]esume" })
map("n", "<leader>s.", "oldfiles", { desc = "[S]earch Recent Files ('.' for repeat)" })
map("n", "<leader>sc", "commands", { desc = "[S]earch Commands" })
