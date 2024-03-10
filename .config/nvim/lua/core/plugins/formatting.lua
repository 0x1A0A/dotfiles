local conform = require("conform")

conform.setup({
	formatters_by_ft = {
		javascript = { { "prettierd", "prettier" } },
		typescript = { { "prettierd", "prettier" } },
		css = { { "prettierd", "prettier" } },
		html = { { "prettierd", "prettier" } },
		yaml = { { "prettierd", "prettier" } },
		json = { { "prettierd", "prettier" } },
		markdown = { { "prettierd", "prettier" } },
		lua = { "stylua" },
		rust = { "rustfmt" },
		go = { "gofmt" },
		sh = { "shfmt" },
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
