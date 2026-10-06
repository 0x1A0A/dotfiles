local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local files = {
	"haskell",
	"python",
	"yaml",
	"lua",
}

autocmd("FileType", {
	group = augroup("dnv_indented", { clear = true }),
	pattern = files,
	callback = function()
		vim.opt_local.et = true
		vim.opt_local.list = true
	end,
})
