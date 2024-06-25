return {
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		enabled = false,
		config = function()
			local lualine = require("lualine")
			lualine.setup({
				sections = {
					lualine_c = { "filename", "require'lsp-status'.status_progress()" },
				},
			})
		end,
	},
}
