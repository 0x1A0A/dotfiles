vim.api.nvim_create_autocmd("FileType", {
	pattern = "haskell",
	callback = function()
		vim.opt.et = true
		vim.opt.list = true
	end,
})

---@type vim.lsp.Config
return {
	filetypes = { "haskell", "lhaskell", "cabal" },
}
