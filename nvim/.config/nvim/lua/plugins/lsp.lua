return {
	"mason-org/mason-lspconfig.nvim",
	opts = {},
	dependencies = {
		{
			"mason-org/mason.nvim",
			build = ":MasonUpdate",
			opts = {},
		},
		"neovim/nvim-lspconfig",
		"saghen/blink.cmp",
	},
}
