local opt = vim.opt

-- gives block cursor in insert mode
-- opt.guicursor = ""

-- Sync clipboard between mac OS and Neovim.
opt.clipboard = "unnamedplus"

--put numbers on the numbers column
opt.number = true
opt.relativenumber = true

opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true

opt.smartindent = true

opt.wrap = true

opt.swapfile = false

-- don't make backup before overwritting file
opt.backup = false

-- save changes in a file incase for later undo
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true

-- time in ms to wait for a keybind to complete
opt.timeoutlen = 500

--highlight current search
opt.hlsearch = true

--show search while typing it
opt.incsearch = true

opt.scrolloff = 8

-- time to accept user input
opt.updatetime = 50

-- command line height (status line still stays)
opt.cmdheight = 0;
