local map = function(mode, lhs, rhs, desc)
	vim.keymap.set(mode, lhs, rhs, { noremap = true, silent = true, desc = desc or nil })
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
map("n", "<leader>e", ":lua MiniFiles.open()<cr>", "Toggle File Explorer")

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

-- -----------------------------------------------------------------
-- ---                        DEBUGGER                           ---
-- -----------------------------------------------------------------
-- map("n", "<leader>dt", function()
-- 	require("dapui").toggle()
-- end, "[D]ap: Toggle UI")
--
-- map("n", "<leader>dc", function()
-- 	require("dap").continue()
-- end, "[D]ap: [C]ontinue or Start Debugging")
--
-- map("n", "<leader>dso", function()
-- 	require("dap").step_over()
-- end, "[D]ap: [S]tep [O]ver the current line")
--
-- map("n", "<leader>dsi", function()
-- 	require("dap").step_into()
-- end, "[D]ap: [S]tep [I]nto the current expression ")
--
-- map("n", "<leader>dsO", function()
-- 	require("dap").step_out()
-- end, "[D]ap: [S]tep [O]ut of the current scope")
--
-- map("n", "<leader>db", function()
-- 	require("dap").toggle_breakpoint()
-- end, "[D]ap: Toggle [B]reakpoint")
--
-- map("n", "<leader>dB", function()
-- 	require("dap").set_breakpoint()
-- end, "[D]ap: Set [B]reakpoint")
--
-- map("n", "<leader>dr", function()
-- 	require("dap").repl.open()
-- end, "[D]ap: Open [R]epl")
--
-- map("n", "<leader>dC", function()
-- 	require("dap").disconnect()
-- end, "[D]ap: Dis[C]onnect")
--
-- map("n", "<leader>dT", function()
-- 	require("dap").terminate()
-- end, "[D]ap: [T]erminate")
--
-- map("n", "<leader>dh", function()
-- 	require("dap.ui.widgets").hover()
-- end, "[D]ap: [H]over")
--
-- map("n", "<leader>dp", function()
-- 	require("dap.ui.widgets").preview()
-- end, "[D]ap: [P]review")
--
--
