---@diagnostic disable: missing-fields, undefined-field
---@type LazySpec
return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	opts = {
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
	},
	config = function(_, opts)
		require("nvim-treesitter.configs").setup(opts)
	end,
}
