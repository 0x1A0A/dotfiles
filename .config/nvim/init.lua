require("core.keymap")
require("core.lazy")

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
vim.o.statusline = stl
