---@type lze.Spec
return {
	{ "friendly-snippets" },
	{ "blink.lib", dep_of = "blink.cmp" },
	{
		"blink.cmp",
		after = function()
			require("blink.cmp").setup({
				keymap = {
					preset = "default",
					["<Tab>"] = {
						function(cmp)
							if cmp.snippet_active() then
								return cmp.accept()
							else
								return cmp.select_and_accept()
							end
						end,
						"snippet_forward",
						"fallback",
					},
					["<S-Tab>"] = { "snippet_backward", "fallback" },
					["<C-o>"] = { "show", "show_documentation", "hide_documentation" },
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
		end,
	},
}
