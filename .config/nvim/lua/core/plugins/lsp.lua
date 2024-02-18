require("mason").setup()
require("mason-lspconfig").setup()

local lspconfig = require("lspconfig")

local on_attach = function(client, _)
	--	client.server_capabilities.documentFormattingProvider = false
	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {})
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {})
	vim.keymap.set("n", "gr", vim.lsp.buf.references, {})

	vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
	vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, {})
	vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, {})
	vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, {})
	vim.keymap.set("n", "<space>wl", function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, {})
	vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, {})
	vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, {})
	vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, {})
	vim.keymap.set("n", "<space>fm", function()
		vim.lsp.buf.format({ async = true })
	end, {})
end

local capabilities = require("cmp_nvim_lsp").default_capabilities()

local get_servers = require("mason-lspconfig").get_installed_servers
for _, server_name in ipairs(get_servers()) do
	lspconfig[server_name].setup({
		capabilities = capabilities,
		on_attach = on_attach,
	})
end

lspconfig["gdscript"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

lspconfig["bashls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

lspconfig["volar"].setup{
  filetypes = {'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json'}
}

