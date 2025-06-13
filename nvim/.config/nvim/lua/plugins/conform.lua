return {
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
			java = { "clang_format" },
			toml = { "taplo" },
			haskell = { "fourmolu" },
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
			"astro",
		}

		for _, key in ipairs(prettier) do
			format[key] = { "biome", "prettierd" }
		end

		conform.setup({
			formatters_by_ft = format,
		})

		vim.keymap.set({ "n", "v" }, "<leader>fm", function()
			conform.format({
				lsp_format = "fallback",
				timeout_ms = 500,
				async = false,
			})
		end)

		vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
	end,
}
