require("core.keymap")

local hooks = function(ev)
	local name, kind = ev.data.spec.name, ev.data.kind

	print(ev)

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

local cb = function(x)
	return "https://codeberg.org/" .. x
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

require("fidget").setup({
	notification = {
		override_vim_notify = true,
	},
})

require("mini.icons").setup()
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

require("mason").setup()
require("mason-lspconfig").setup()

require("lze").load({
	{
		"oil.nvim",
		lazy = false,
		after = function(_)
			require("oil").setup({
				default_file_explorer = false,
			})
		end,
	},
	{
		"lazydev.nvim",
		ft = "lua",
		after = function(_)
			require("lazydev").setup({
				library = {
					-- See the configuration section for more details
					-- Load luvit types when the `vim.uv` word is found
					{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
					"lazy.nvim",
				},
			})
		end,
	},
	{
		"conform.nvim",
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
			},
		},
		after = function(_)
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

			require("conform").setup({
				formatters_by_ft = format,
				default_format_opts = {
					lsp_format = "fallback",
				},
			})

			vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
		end,
	},
	{
		"outline.nvim",
		lazy = true,
		cmd = { "Outline", "OutlineOpen" },
		keys = { -- Example mapping to toggle outline
			{ "<leader>o", "<cmd>Outline<CR>", desc = "Toggle outline" },
		},
		after = function()
			require("outline").setup({})
		end,
	},
	{
		"typst-preview.nvim",
		ft = "typst",
		after = function()
			require("typst-preview").setup({})
		end,
	},
	{
		"vim-fugitive",
		cmd = { "Git", "G" },
		keys = {
			{ "<leader>vc", ":Git<cr>" },
		},
	},
	{
		"plenary.nvim",
		dep_of = "telescope.nvim",
	},
	{
		"telescope-fzf-native.nvim",
		dep_of = "telescope.nvim",
	},
	{
		"telescope.nvim",
		lazy = true,
		cmd = "Telescope",
		keys = {
			{ "<leader>ff", "<cmd>Telescope find_files<cr>", mode = "n" },
			{ "<leader>fv", "<cmd>Telescope git_files<cr>", mode = "n" },
			{ "<leader>fg", "<cmd>Telescope live_grep<cr>", mode = "n" },
			{ "<leader>fb", "<cmd>Telescope buffers<cr>", mode = "n" },
			{ "<leader>fh", "<cmd>Telescope help_tags<cr>", mode = "n" },
		},
		after = function()
			local actions = require("telescope.actions")

			local opts = {
				extensions = {
					fzf = {
						fuzzy = true, -- false will only do exact matching
						override_generic_sorter = true, -- override the generic sorter
						override_file_sorter = true, -- override the file sorter
						case_mode = "smart_case", -- or "ignore_case" or "respect_case"
						-- the default case_mode is "smart_case"
					},
				},
			}

			local mappings = {
				i = { ["<m-d>"] = actions.delete_buffer + actions.move_to_top },
			}

			opts.defaults = { mappings = mappings }

			require("telescope").setup(opts)
			require("telescope").load_extension("fzf")
		end,
	},
})

vim.cmd.packadd("nvim.undotree")

vim.cmd.colorscheme("catppuccin")

vim.opt.guicursor = ""
vim.opt.number = true
vim.opt.updatetime = 66

vim.opt.foldenable = false
vim.opt.foldmethod = "indent"

vim.opt.syntax = "off"

vim.opt.cul = true
vim.opt.hlsearch = false

vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.breakindent = true
vim.opt.showbreak = ">> "

vim.opt.scrolloff = 8
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4

local stl = "%<%f%h%m%r%=%b 0x%B"
stl = stl .. " %l,%c%V"
stl = stl .. " %#NeoTreeFilterTerm#%y%## %P"

vim.opt.statusline = stl
vim.opt.scl = "yes"
