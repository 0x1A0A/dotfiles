local keymap = vim.keymap.set

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
	{
		"catppuccin",
		after = function()
			vim.cmd.colorscheme("catppuccin")
		end,
	},
	{ "mini.icons" },
	{ "nvim-treesitter" },
	{ "nvim.undotree" },
	{ "plenary.nvim" },
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
			local oil = require("oil")
			oil.setup({
				default_file_explorer = false,
			})

			keymap("n", "<leader>-", oil.toggle_float)
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
	{
		"fzf-lua",
		lazy = false,
		cmd = "FzfLua",
		keys = {
			{ "<leader>fz", vim.cmd.FzfLua, mode = "n" },
			{ "<leader>ff", "<cmd>FzfLua files<CR>", mode = "n" },
			{ "<leader>fv", "<cmd>FzfLua git_files<CR>", mode = "n" },
			{ "<leader>fg", "<cmd>FzfLua live_grep<CR>", mode = "n" },
			{ "<leader>fb", "<cmd>FzfLua buffers<CR>", mode = "n" },
			{ "<leader>fh", "<cmd>FzfLua helptags<CR>", mode = "n" },
		},
		after = function()
			require("fzf-lua").setup({ ui_select = true })
		end,
	},
}
