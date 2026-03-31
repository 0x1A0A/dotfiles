local installed_parser = require("nvim-treesitter").get_installed()

local filetypes = {}

for _, v in ipairs(installed_parser) do
	local ft = vim.treesitter.language.get_filetypes(v)
	for _, f in ipairs(ft) do
		table.insert(filetypes, f)
	end
end

vim.api.nvim_create_autocmd("FileType", {
	pattern = filetypes,
	callback = function()
		vim.treesitter.start()
	end,
})
