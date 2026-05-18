---@type lze.Spec
return {
	{
		"flutter-tools.nvim",
		lazy = false,
		after = function()
			require("flutter-tools").setup({})
		end,
	},
}
