---@type lze.Spec
return {
	{
		"mason.nvim",
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
