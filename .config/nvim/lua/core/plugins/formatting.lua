local conform = require("conform")

local format = {
	lua = { "stylua" },
	rust = { "rustfmt" },
	go = { "gofmt" },
	sh = { "shfmt" },
	gdscript = { "gdformat" },
}

local prettier = {
	"javascript",
	"typescript",
	"css",
	"scss",
	"html",
	"yaml",
	"json",
	"markdown",
}

for _, key in ipairs(prettier) do
	format[key] = { { "prettierd", "prettier" } }
end

conform.setup({
	formatters_by_ft = format,
})

vim.keymap.set({ "n", "v" }, "<leader>fm", function()
	conform.format({
		lsp_fallbacck = true,
		async = false,
		timeout_ms = 500,
	})
end)
