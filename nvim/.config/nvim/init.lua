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
	{ src = gh("saghen/blink.cmp"), version = vim.version.range("1.*") },

	gh("mason-org/mason.nvim"),
	gh("neovim/nvim-lspconfig"),
	gh("mason-org/mason-lspconfig.nvim"),
	gh("j-hui/fidget.nvim"),

	{ src = gh("stevearc/oil.nvim") },
	{ src = gh("folke/lazydev.nvim") },
	{ src = gh("stevearc/conform.nvim") },

	{ src = gh("nvim-lua/plenary.nvim") },
	{ src = gh("nvim-telescope/telescope-fzf-native.nvim") },
	{ src = gh("nvim-telescope/telescope.nvim") },

	{ src = gh("hedyhli/outline.nvim") },
	{ src = gh("chomosuke/typst-preview.nvim"), version = vim.version.range("1.*") },
	{ src = gh("tpope/vim-fugitive") },
}, {
	load = function(_) end,
})

require("lze").load(require("specs"))
