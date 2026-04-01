local keymap = vim.keymap.set

vim.g.mapleader = " "

keymap("n", "<leader>pv", vim.cmd.Ex)
keymap("n", "<leader>h", ":noh<CR>")

keymap("v", "J", ":m '>+1<CR>gv=gv")
keymap("v", "K", ":m '<-2<CR>gv=gv")

keymap("n", "<leader>u", vim.cmd.Undotree)
