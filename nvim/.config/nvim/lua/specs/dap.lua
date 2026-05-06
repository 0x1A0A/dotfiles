--- @type lze.Spec
return {
	{
		"nvim-dap",
		dep_of = "nvim-dap-virtual-text",
		after = function() end,
	},
	{
		"nvim-dap-virtual-text",
		event = "LspAttach",
		after = function()
			require("nvim-dap-virtual-text").setup({})
		end,
	},
	{
		"nvim-dap-view",
		dep_of = "nvim-dap-virtual-text",
		after = function() end,
	},
}
