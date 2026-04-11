---@type lze.Spec
return {
	{
		"fidget.nvim",
		after = function()
			require("fidget").setup({
				notification = {
					override_vim_notify = true,
				},
			})
		end,
	},
	{ "mini.icons" },
	{ "nvim-treesitter" },
	{ "nvim.undotree" },
	{
		"lazydev.nvim",
		ft = "lua",
		after = function(_)
			require("lazydev").setup({
				library = {
					{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
					"lazy.nvim",
				},
			})
		end,
	},
	{
		"oil.nvim",
		after = function(_)
			require("oil").setup({
				default_file_explorer = false,
			})
		end,
	},
	{
		"outline.nvim",
		lazy = true,
		cmd = { "Outline", "OutlineOpen" },
		keys = { -- Example mapping to toggle outline
			{ "<leader>o", vim.cmd.Outline, desc = "Toggle outline" },
		},
		after = function()
			require("outline").setup({})
		end,
	},
	{
		"typst-preview.nvim",
		ft = "typst",
		after = function()
			require("typst-preview").setup({})
		end,
	},
	{
		"vim-fugitive",
		cmd = { "Git", "G" },
		keys = {
			{ "<leader>vc", vim.cmd.Git },
		},
	},
}
