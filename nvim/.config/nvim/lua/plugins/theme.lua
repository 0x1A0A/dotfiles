return {
	{
		"catppuccin/nvim",
		name = "catpuccin",
		config = function()
			vim.cmd.colorscheme("catppuccin")
		end,
	},
	{
		"Shatur/neovim-ayu",
		name = "ayu-theme",
		enabled = false,
		config = function()
			vim.cmd.colorscheme("ayu")
		end,
	},
}
