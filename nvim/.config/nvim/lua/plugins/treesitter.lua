---@diagnostic disable: missing-fields, undefined-field
---@type LazySpec
return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	branch = "main",
	opts = {},
}
