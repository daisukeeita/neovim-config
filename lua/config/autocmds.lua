vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold" }, {
	pattern = "*.java",
	callback = function()
		if #vim.lsp.get_clients({ name = "jdtls" }) > 0 then
			vim.lsp.codelens.refresh()
		end
	end,
})

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	callback = function()
		require("lint").try_lint()
	end,
})
