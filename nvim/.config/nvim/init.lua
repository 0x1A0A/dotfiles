require("core.option")
require("core.keymap")
require("specs.hooks")

local gh = function(x)
	return "https://github.com/" .. x
end

-- lazy loader
vim.pack.add({ gh("birdeehub/lze") })

-- plugins
vim.pack.add({
	{ src = gh("catppuccin/nvim"), name = "catppuccin" },
	{ src = gh("nvim-mini/mini.icons") },
	{ src = gh("nvim-treesitter/nvim-treesitter"), version = "main" },

	gh("rafamadriz/friendly-snippets"),
	gh("saghen/blink.lib"),
	{ src = gh("saghen/blink.cmp"), version = "main" },

	gh("mason-org/mason.nvim"),
	gh("neovim/nvim-lspconfig"),
	gh("mason-org/mason-lspconfig.nvim"),
	gh("j-hui/fidget.nvim"),

	gh("nvim-lua/plenary.nvim"),

	{ src = gh("stevearc/oil.nvim") },
	{ src = gh("folke/lazydev.nvim") },
	{ src = gh("stevearc/conform.nvim") },

	{ src = gh("ibhagwan/fzf-lua") },

	{ src = gh("hedyhli/outline.nvim") },
	{ src = gh("chomosuke/typst-preview.nvim"), version = vim.version.range("1.*") },
	{ src = gh("tpope/vim-fugitive") },

	{ src = gh("mfussenegger/nvim-dap") },
	{ src = gh("thehamsta/nvim-dap-virtual-text") },
	{ src = gh("igorlfs/nvim-dap-view") },

	gh("nvim-flutter/flutter-tools.nvim"),

	{ src = gh("mrcjkb/rustaceanvim"), version = vim.version.range("^9") },

	gh("scalameta/nvim-metals"),
}, {
	load = function(_) end,
})

require("lze").load(require("specs"))
