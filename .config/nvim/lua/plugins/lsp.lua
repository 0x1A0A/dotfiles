return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/nvim-cmp",
			{
				"williamboman/mason.nvim",
				lazy = false,
				build = ":MasonUpdate",
			},
			{ "L3MON4D3/LuaSnip", dependencies = { "rafamadriz/friendly-snippets" } },
			{ "saadparwaiz1/cmp_luasnip" },
			"williamboman/mason-lspconfig.nvim",
		},
		config = function()
			local cmp = require("cmp")

			require("luasnip.loaders.from_vscode").lazy_load()

			cmp.setup({
				mapping = cmp.mapping.preset.insert({
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-o>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<C-i>"] = cmp.mapping.confirm({ select = true }),
				}),
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
					end,
				},
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
				}, {
					{ name = "buffer" },
				}),
			})

			require("mason").setup()
			require("mason-lspconfig").setup()

			vim.keymap.set("n", "<space>e", vim.diagnostic.open_float)
			vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
			vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
			vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist)

			-- Use LspAttach autocommand to only map the following keys
			-- after the language server attaches to the current buffer
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspConfig", {}),
				callback = function(ev)
					-- Enable completion triggered by <c-x><c-o>
					vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

					-- Buffer local mappings.
					-- See `:help vim.lsp.*` for documentation on any of the below functions
					local opts = { buffer = ev.buf }
					vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
					vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
					vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
					vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
					vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
					vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
					vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
					vim.keymap.set("n", "<space>wl", function()
						print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
					end, opts)
					vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
					vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
					vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts)
					vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
					--    vim.keymap.set('n', '<space>fm', function()
					--      vim.lsp.buf.format { async = true }
					--    end, opts)
				end,
			})

			local lspconfig = require("lspconfig")
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			local get_servers = require("mason-lspconfig").get_installed_servers
			for _, server_name in ipairs(get_servers()) do
				lspconfig[server_name].setup({
					capabilities = capabilities,
				})
			end

			lspconfig["gdscript"].setup({
				capabilities = capabilities,
			})

			lspconfig["bashls"].setup({
				capabilities = capabilities,
			})

			--lspconfig["volar"].setup{
			--  filetypes = {'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json'}
			--}

			lspconfig.denols.setup({
				root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc"),
			})

			lspconfig.tsserver.setup({
				root_dir = lspconfig.util.root_pattern("package.json"),
				single_file_support = false,
			})

			lspconfig.angularls.setup({
				filetypes = { "typescript", "html", "typescriptreact", "typescript.tsx", "angular.html" },
			})
		end,
	},
}
