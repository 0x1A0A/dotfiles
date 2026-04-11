---@type lze.Spec
return {
	{
		"mason.nvim",
		priority = 90,
		after = function()
			require("mason").setup()
		end,
	},
	{
		"mason-lspconfig.nvim",
		after = function()
			require("mason-lspconfig").setup()
		end,
	},
	{ "nvim-lspconfig" },
}
