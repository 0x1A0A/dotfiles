---@type vim.lsp.Config
return {
	cmd = { "bundle", "exec", "ruby-lsp" },
	init_options = {
		addonSettings = {
			["Ruby LSP Rails"] = {
				enablePendingMigrationsPrompt = false,
			},
		},
	},
}
