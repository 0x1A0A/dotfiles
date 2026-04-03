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
	kdl = { "kdlfmt" },
	typst = { "prettypst" },
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

local fpg = require("fidget.progress")

require("lze").load({
	{
		"conform.nvim",
		lazy = true,
		cmd = "ConformInfo",
		keys = {
			{
				"<leader>fm",
				function()
					local progress = fpg.handle.create({
						title = "format " .. vim.fn.expand("%:t"),
						message = "Working on it",
					})

					local start = vim.loop.now()

					require("conform").format({ async = true }, function(err, success)
						local elapsed = vim.loop.now() - start
						local delay = math.max(0, 150 - elapsed)

						vim.defer_fn(function()
							if err then
								progress:report({ message = err })
								progress:cancel()
								return
							end

							progress:report({
								message = success and "Polished" or "Already clean",
							})
							progress:finish()
						end, delay)
					end)
				end,
				mode = "",
			},
		},
		after = function(_)
			require("conform").setup({
				formatters_by_ft = format,
				default_format_opts = {
					lsp_format = "fallback",
				},
			})
		end,
	},
})
