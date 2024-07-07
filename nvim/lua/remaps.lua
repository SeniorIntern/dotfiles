-- set space key as leader key
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- move visual block up, down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- append the line below to current line
vim.keymap.set("n", "J", "mzJ`z")

-- jump up, down half page
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- allows search term to stay in the middle
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- preserve value when paste
vim.keymap.set("x", "<leader>p", [["_dP]])

-- delete without yanking
vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

-- vim.keymap.set("n", "<leader>f", vim.lsp.buf.format) -- replace current word

-- source bind
vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)

local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<C-o>', '<Cmd>TSToolsOrganizeImports<CR>', opts)
