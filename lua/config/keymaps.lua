local map = function (mode, lhs, rhs, desc)
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
map( {"n", "v"}, "<leader>y", '"+y', "Copy to clipboard")

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
map("n", "<leader>e", ":Neotree toggle<cr>", "Toggle Neo-Tree")

-----------------------------------------------------------------
---                   BUFFER NAVIGATION                       ---
-----------------------------------------------------------------
map("n", "<S-h>", ":bprevious<CR>", "Go to previous buffer")
map("n", "<S-l>", ":bnext<CR>", "Go to next buffer")
map("n", "<leader>bd", ":bp|bd #<CR>", "Delete a buffer")

-----------------------------------------------------------------
---                      DIAGNOSTICS                          ---
-----------------------------------------------------------------
map("n", "<leader>do", ":lua vim.diagnostic.open_float()<CR>", "Open Diagnostic Description")
