local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

autocmd("FileType", {
	group = augroup("dnv_treesitter", { clear = true }),
	callback = function(args)
		local filetype = args.match
		local lang = vim.treesitter.language.get_lang(filetype)
		if lang and vim.treesitter.language.add(lang) then
			vim.treesitter.start()
		end
	end,
})
