local conform = require("conform")

conform.setup({
	formatters_by_ft = {
		lua = { "stylua" },
		-- Conform will run multiple formatters sequentially
		javascript = { "prettier" },

		gdscript = { "gdformat" },
	},
})

vim.keymap.set({ "n", "v" }, "<leader>fm", function()
	conform.format({
		lsp_fallbacck = true,
		async = false,
		timeout_ms = 500,
	})
end)
