vim.api.nvim_create_autocmd("PackChanged", {
	desc = "Telescope: Build fzf-native extension",
	callback = function(ev)
		local name = ev.data.spec.name
		local kind = ev.data.kind

		if name == "telescope-fzf-native.nvim" and (kind == "install" or kind == "update") then
			vim.system({ "make" }, { cwd = ev.data.path })
		end
	end,
})

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.hl.on_yank()
	end,
})

-- vim.api.nvim_create_autocmd("FileType", {
-- 	callback = function(args)
-- 		pcall(vim.treesitter.start, args.buf)
-- 	end,
-- })

-- vim.api.nvim_create_autocmd("BufWritePost", {
-- 	pattern = "*.java",
-- 	callback = function()
-- 		if #vim.lsp.get_clients({ name = "jdtls" }) > 0 then
-- 			vim.lsp.codelens.refresh()
-- 		end
-- 	end,
-- })
--
-- vim.api.nvim_create_autocmd({ "BufWritePost" }, {
-- 	callback = function()
-- 		require("lint").try_lint()
-- 	end,
-- })
--
