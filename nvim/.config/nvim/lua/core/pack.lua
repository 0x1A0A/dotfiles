local hooks = function(ev)
	local name, kind = ev.data.spec.name, ev.data.kind

	local build = kind == "install" or kind == "update"

	if name == "mason.nvim" and build then
		vim.cmd("MasonUpdate")
	end

	if name == "nvim-treesitter" and build then
		vim.cmd("TSUpdate")
	end

	if name == "telescope-fzf-native.nvim" and build then
		vim.system({ "make" }, { cwd = ev.data.path })
	end
end

vim.api.nvim_create_autocmd("PackChanged", { callback = hooks })

local gh = function(x)
	return "https://github.com/" .. x
end

-- these dont need lazy loading
vim.pack.add({
	gh("BirdeeHub/lze"),
	{ src = gh("catppuccin/nvim"), name = "catppuccin" },
	{ src = gh("nvim-mini/mini.icons") },
	{ src = gh("nvim-treesitter/nvim-treesitter"), version = "main" },

	gh("rafamadriz/friendly-snippets"),
	{ src = gh("saghen/blink.cmp"), version = vim.version.range("1.*") },

	gh("mason-org/mason.nvim"),
	gh("neovim/nvim-lspconfig"),
	gh("mason-org/mason-lspconfig.nvim"),
	gh("j-hui/fidget.nvim"),
})

-- these will be controled by lze
vim.pack.add({
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
