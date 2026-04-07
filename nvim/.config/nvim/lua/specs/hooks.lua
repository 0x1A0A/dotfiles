local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local hooks = function(ev)
	local name, kind = ev.data.spec.name, ev.data.kind

	local build = kind == "install" or kind == "update"
	local update = kind == "update"

	if name == "mason.nvim" and update then
		if not ev.data.active then
			vim.cmd.packadd("mason.nvim")
		end
		vim.cmd("MasonUpdate")
	end

	if name == "nvim-treesitter" and update then
		if not ev.data.active then
			vim.cmd.packadd("nvim-treesitter")
		end
		vim.cmd("TSUpdate")
	end

	if name == "telescope-fzf-native.nvim" and build then
		vim.system({ "make" }, { cwd = ev.data.path })
	end
end

autocmd("PackChanged", { callback = hooks, group = augroup("dnv_pack_hooks", {}) })
