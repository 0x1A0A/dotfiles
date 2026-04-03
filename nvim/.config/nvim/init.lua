require("core.pack")
require("core.option")
require("core.keymap")
require("core.formatter")
require("core.picker")
require("core.completion")

require("fidget").setup({
	notification = {
		override_vim_notify = true,
	},
})

require("mini.icons").setup()

require("mason").setup()
require("mason-lspconfig").setup()

require("lze").load({
	{ "nvim.undotree", lazy = false },
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
		lazy = false,
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
})

vim.cmd.colorscheme("catppuccin")
