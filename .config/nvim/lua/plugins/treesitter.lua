---@diagnostic disable: missing-fields, undefined-field
return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = { "go", "javascript", "rust", "typescript", "c", "lua", "vim", "vimdoc", "query" },
				sync_install = false,
				auto_install = true,
				highlight = {
					enable = true,

					disable = function(_, buf)
						local max_filesize = 100 * 1024 -- 100 KB
						local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
						if ok and stats and stats.size > max_filesize then
							return true
						end
					end,

					additional_vim_regex_highlighting = false,
				},
			})

			if false then
				vim.filetype.add({
					pattern = {
						[".*%.component%.html"] = "angular.html", -- Sets the filetype to `angular.html` if it matches the pattern
					},
				})

				vim.api.nvim_create_autocmd("FileType", {
					pattern = "angular.html",
					callback = function()
						vim.treesitter.language.register("angular", "angular.html") -- Register the filetype with treesitter for the `angular` language/parser
					end,
				})
			end
		end,
	},
}
