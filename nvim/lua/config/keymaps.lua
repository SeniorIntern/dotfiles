-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local discipline = require("nikhil.discipline")

discipline.cowboy()

vim.g.mapleader = " "

-- move visual block
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.api.nvim_set_keymap("n", "<leader>tf", "<Plug>PlenaryTestFile", { noremap = false, silent = false })

-- append line below to curren line but cursor stays in same place
vim.keymap.set("n", "J", "mzJ`z")

-- half page jumping
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- keep search term in middle of screen
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- paste but preserve current copy
vim.keymap.set("x", "<leader>p", [["_dP]])

vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]]) -- yank
vim.keymap.set("n", "<leader>Y", [["+Y]]) -- yank in system clipboard

vim.keymap.set({ "n", "v" }, "<leader>d", '"_d')

vim.keymap.set("n", "Q", "<nop>") -- disable Q
vim.keymap.set("n", "<leader>fw", function()
  require("conform").format({ bufnr = 0 })
end)

-- replace all current word on cusor
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
