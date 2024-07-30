-- 24 bit RGB color
vim.opt.termguicolors = true

-- setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25

require("config.lazy")
require("nikhil.remaps")
require("nikhil.options")
