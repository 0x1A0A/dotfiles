local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local keymap = vim.keymap.set

keymap("n", "<space>e", vim.diagnostic.open_float)
keymap("n", "[d", vim.diagnostic.get_prev)
keymap("n", "]d", vim.diagnostic.get_next)
keymap("n", "<space>q", vim.diagnostic.setloclist)

autocmd("LspAttach", {
	group = augroup("dnv_lsp", {}),
	callback = function(ev)
		-- Enable completion triggered by <c-x><c-o>
		vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

		-- Buffer local mappings.
		-- See `:help vim.lsp.*` for documentation on any of the below functions
		local opts = { buffer = ev.buf }
		keymap("n", "gD", vim.lsp.buf.declaration, opts)
		keymap("n", "gd", vim.lsp.buf.definition, opts)
		keymap("n", "K", vim.lsp.buf.hover, opts)
		keymap("n", "gi", vim.lsp.buf.implementation, opts)
		keymap("n", "<C-k>", vim.lsp.buf.signature_help, opts)
		keymap("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
		keymap("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
		keymap("n", "<space>wl", function()
			print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		end, opts)
		keymap("n", "<space>D", vim.lsp.buf.type_definition, opts)
		keymap("n", "<space>rn", vim.lsp.buf.rename, opts)
		keymap({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts)
		keymap("n", "gr", vim.lsp.buf.references, opts)
	end,
})

local enable_server = {
	"gdscript",
	"bashls",
	"glasgow",
	"hls",
	"rust_analyzer",
	"lua_ls",
	"denols",
	"vtsls",
	"vue_ls",
	--"ts_ls",
}

for _, server in ipairs(enable_server) do
	vim.lsp.enable(server)
end
