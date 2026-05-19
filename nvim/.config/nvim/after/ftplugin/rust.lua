local bufnr = vim.api.nvim_get_current_buf()
local keymap = vim.keymap.set
local cmd = vim.cmd

keymap("n", "<leader>ca", function()
	cmd.RustLsp("codeAction")
end, { silent = true, buffer = bufnr })

keymap("n", "K", function()
	cmd.RustLsp({ "hover", "actions" })
end, { silent = true, buffer = bufnr })
