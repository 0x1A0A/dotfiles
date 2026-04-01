require("blink.cmp").setup({
	keymap = {
		preset = "default",
		["<Tab>"] = { "select_and_accept", "fallback" },
		["<C-o>"] = { "show", "show_documentation", "hide_documentation" },
		["<S-Tab>"] = { "snippet_forward", "fallback" },
	},

	appearance = {
		nerd_font_variant = "mono",
	},

	completion = { documentation = { auto_show = false } },

	sources = {
		default = { "lsp", "path", "snippets", "buffer" },
	},

	signature = { enabled = true },

	fuzzy = { implementation = "prefer_rust_with_warning" },
})
