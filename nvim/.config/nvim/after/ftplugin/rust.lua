local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local bufnr = vim.api.nvim_get_current_buf()
local keymap = vim.keymap.set
local cmd = vim.cmd

keymap("n", "K", function()
	cmd.RustLsp({ "hover", "actions" })
end, { silent = true, buffer = bufnr })

autocmd("LspAttach", {
	group = augroup("dnv_rust_" .. bufnr, { clear = true }),
	buffer = bufnr,
	callback = function()
		keymap("n", "<leader>ca", function()
			cmd.RustLsp("codeAction")
		end, { silent = true, buffer = bufnr })
	end,
})
