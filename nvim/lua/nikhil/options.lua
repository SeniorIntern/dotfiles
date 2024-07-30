-- gives block cursor in insert mode
vim.opt.guicursor = ""

-- Sync clipboard between OS and Neovim.
vim.opt.clipboard = "unnamedplus"

--put numbers on the side
vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = true

vim.opt.swapfile = false

-- don't make backup before overwritting file
vim.opt.backup = false

-- save changes in a file incase for later undo
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- time in ms to wait for a keybind to complete
vim.opt.timeoutlen = 500

--highlight current search
vim.opt.hlsearch = true

--show search while typing it
vim.opt.incsearch = true

vim.opt.scrolloff = 8

-- time to accept user input
vim.opt.updatetime = 50

--[[ Minimal number of columns to use for the line number.  Only relevant
	when the 'number' or 'relativenumber' option is set or printing lines
	with a line number. Since one space is always between the number and
	the text, there is one less character for the number itself. ]]
vim.cmd("set numberwidth=1")

-- command line height (status line still stays)
vim.opt.cmdheight = 0;
