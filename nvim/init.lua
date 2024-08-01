require("config.lazy")
require("config.keymaps")
require("config.options")

-- enable 24 bit RGB color
vim.opt.termguicolors = true

-- setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

-- Minimal number of columns to use for the line number.
vim.cmd("set numberwidth=1")
