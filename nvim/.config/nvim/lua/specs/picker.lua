---@type lze.Spec
return {
	{
		"fzf-lua",
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
			require("fzf-lua").setup({})
		end,
	},
}
