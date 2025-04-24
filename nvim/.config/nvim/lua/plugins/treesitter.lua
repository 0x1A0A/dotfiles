---@diagnostic disable: missing-fields, undefined-field
return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = {
					"go",
					"javascript",
					"rust",
					"typescript",
					"c",
					"lua",
					"vim",
					"vimdoc",
					"query",
					"diff",
				},
				sync_install = false,
				auto_install = true,
				highlight = {
					enable = true,
					additional_vim_regex_highlighting = false,
				},
			})
		end,
	},
}
