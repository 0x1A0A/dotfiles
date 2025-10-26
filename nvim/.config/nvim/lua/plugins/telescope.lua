---@type LazySpec
return {
	"nvim-telescope/telescope.nvim",
	lazy = true,
	branch = "0.1.x",
	cmd = "Telescope",
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},
	keys = {
		{ "<leader>ff", "<cmd>Telescope find_files<cr>", mode = "n" },
		{ "<leader>fv", "<cmd>Telescope git_files<cr>", mode = "n" },
		{ "<leader>fg", "<cmd>Telescope live_grep<cr>", mode = "n" },
		{ "<leader>fb", "<cmd>Telescope buffers<cr>", mode = "n" },
		{ "<leader>fh", "<cmd>Telescope help_tags<cr>", mode = "n" },
	},
	opts = {
		extensions = {
			fzf = {
				fuzzy = true, -- false will only do exact matching
				override_generic_sorter = true, -- override the generic sorter
				override_file_sorter = true, -- override the file sorter
				case_mode = "smart_case", -- or "ignore_case" or "respect_case"
				-- the default case_mode is "smart_case"
			},
		},
	},
	config = function(_, opts)
		local actions = require("telescope.actions")

		local mappings = {
			i = { ["<m-d>"] = actions.delete_buffer + actions.move_to_top },
		}

		opts.defaults = { mappings = mappings }

		require("telescope").setup(opts)
		require("telescope").load_extension("fzf")
	end,
}
