return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			{
				"williamboman/mason.nvim",
				build = ":MasonUpdate",
			},
			"williamboman/mason-lspconfig.nvim",
		},
		config = function()
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
				server_name = server_name == "tsserver" and "ts_ls" or server_name
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

			lspconfig.denols.setup({
				root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc"),
			})

			lspconfig["volar"].setup({})

			lspconfig.ts_ls.setup({
				init_options = {
					plugins = {
						{
							name = "@vue/typescript-plugin",
							location = "/usr/local/lib/node_modules/@vue/typescript-plugin",
							languages = { "javascript", "typescript", "vue" },
						},
					},
				},
				root_dir = lspconfig.util.root_pattern("package.json"),
				single_file_support = false,
				capabilities = capabilities,
				filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
			})

			lspconfig["glasgow"].setup({})
		end,
	},
}
