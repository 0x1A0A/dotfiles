---@type vim.lsp.Config
return {
	cmd = { "mise", "exec", "--", "ruby-lsp" },
	init_options = {
		addonSettings = {
			["Ruby LSP Rails"] = {
				enablePendingMigrationsPrompt = false,
			},
		},
	},
}
