---@type lze.Spec
return {
	{
		"plenary.nvim",
		dep_of = "telescope.nvim",
	},
	{
		"telescope-fzf-native.nvim",
		dep_of = "telescope.nvim",
	},
	{
		"telescope.nvim",
		lazy = true,
		cmd = "Telescope",
		keys = {
			{ "<leader>ff", "<cmd>Telescope find_files<cr>", mode = "n" },
			{ "<leader>fv", "<cmd>Telescope git_files<cr>", mode = "n" },
			{ "<leader>fg", "<cmd>Telescope live_grep<cr>", mode = "n" },
			{ "<leader>fb", "<cmd>Telescope buffers<cr>", mode = "n" },
			{ "<leader>fh", "<cmd>Telescope help_tags<cr>", mode = "n" },
		},
		after = function()
			local actions = require("telescope.actions")

			require("telescope").setup({
				defaults = {
					mappings = {
						i = { ["<m-d>"] = actions.delete_buffer + actions.move_to_top },
					},
				},
				extensions = {
					fzf = {
						fuzzy = true, -- false will only do exact matching
						override_generic_sorter = true, -- override the generic sorter
						override_file_sorter = true, -- override the file sorter
						case_mode = "smart_case", -- or "ignore_case" or "respect_case"
						-- the default case_mode is "smart_case"
					},
				},
			})

			require("telescope").load_extension("fzf")
		end,
	},
}
