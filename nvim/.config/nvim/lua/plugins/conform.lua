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

---@type LazySpec
return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	lazy = true,
	cmd = "ConformInfo",
	keys = {
		{
			"<leader>fm",
			function()
				require("conform").format({ async = false })
			end,
			mode = "",
			desc = "Format buffer using conform",
		},
	},
	---@type conform.setupOpts
	opts = {
		formatters_by_ft = format,
		default_format_opts = {
			lsp_format = "fallback",
		},
	},
	init = function()
		-- If you want the formatexpr, here is the place to set it
		vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
	end,
}
