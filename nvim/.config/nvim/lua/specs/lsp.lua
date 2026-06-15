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
	{ "rustaceanvim" },
	{
		"flutter-tools.nvim",
		lazy = false,
		after = function()
			require("flutter-tools").setup({})
		end,
	},
	{
		"nvim-metals",
		ft = { "scala", "sbt", "java" },
		after = function()
			local metals_config = require("metals").bare_config()
			metals_config.on_attach = function(client, bufnr)
				-- your on_attach function
			end

			local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
			vim.api.nvim_create_autocmd("FileType", {
				pattern = { "scala", "sbt", "java" },
				callback = function()
					require("metals").initialize_or_attach(metals_config)
				end,
				group = nvim_metals_group,
			})
		end,
	},
}
