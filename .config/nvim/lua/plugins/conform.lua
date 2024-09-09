return {
	{
		"stevearc/conform.nvim",
		lazy = false,
		config = function()
			local conform = require("conform")

			local format = {
				lua = { "stylua" },
				rust = { "rustfmt" },
				go = { "gofmt" },
				sh = { "shfmt" },
				gdscript = { "gdformat" },
				cpp = { "clang_format" },
				c = { "clang_format" },
			}

			local prettier = {
				"javascript",
				"javascriptreact",
				"typescript",
				"typescriptreact",
				"css",
				"scss",
				"html",
				"yaml",
				"json",
				"markdown",
				"vue",
			}

			for _, key in ipairs(prettier) do
				format[key] = { "prettierd" }
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
		end,
	},
}
