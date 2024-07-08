-- about this neovim-configuration

-- features: completion, lsp, tree-sitter, telescope, harpoon, formatter, automatic configuration of indendation.
-- setup goals: web development with typescript and tsx.

-- external setup
-- install git and neovim. e.g., with guix as package-manager, run:
-- npm i -g prettier typescript typescript-language-server vscode-langservers-extracted

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)


-- Setup `mapleader`
vim.g.mapleader = " "

require('lazy').setup(
{
	-- themes
	-- should have a high priority

	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
	},

	-- autocompletion

	{
		-- package recommended by https://github.com/neovim/nvim-lspconfig/wiki/Autocompletion/217feffc675a17d8ab95259ed9d4c6d62e1cd2e1#autocompletion-not-built-in-vs-completion-built-in
		'hrsh7th/nvim-cmp',
		config = function(cmp)
			local cmp = require('cmp')
			cmp.setup({
				completion = { completeopt = 'menu,menuone,noinsert' },
				-- if desired, choose another keymap-preset:
				mapping = cmp.mapping.preset.insert(),
				-- optionally, add more completion-sources:
				sources = cmp.config.sources({{ name = 'nvim_lsp' }}),
			})
		end,
	},

	---- code formatting

	{
		'mhartington/formatter.nvim',
		config = function()
			local formatter_prettier = { require('formatter.defaults.prettier') }
			require("formatter").setup({
				filetype = {
					javascript      = formatter_prettier,
					javascriptreact = formatter_prettier,
					typescript      = formatter_prettier,
					typescriptreact = formatter_prettier,
				}
			})
			-- automatically format buffer before writing to disk:
			vim.api.nvim_create_augroup('BufWritePreFormatter', {})
			vim.api.nvim_create_autocmd('BufWritePre', {
				command = 'FormatWrite',
				group = 'BufWritePreFormatter',
				pattern = { '*.js', '*.jsx', '*.ts', '*.tsx' },
			})
		end,
		ft = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
	},

	---- language server protocol (lsp)

	{
		-- use official lspconfig package (and enable completion):
		'neovim/nvim-lspconfig', dependencies = { 'hrsh7th/cmp-nvim-lsp' },
		config = function()
			local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()
			local lsp_on_attach = function(client, bufnr)
				local bufopts = { noremap=true, silent=true, buffer=bufnr }
				-- following keymap is based on both lspconfig and lsp-zero.nvim:
				-- - https://github.com/neovim/nvim-lspconfig/blob/fd8f18fe819f1049d00de74817523f4823ba259a/README.md?plain=1#L79-L93
				-- - https://github.com/VonHeikemen/lsp-zero.nvim/blob/18a5887631187f3f7c408ce545fd12b8aeceba06/lua/lsp-zero/server.lua#L285-L298
				vim.keymap.set('n', '<leader>K', vim.lsp.buf.hover                                 , bufopts)
				vim.keymap.set('n', '<leader>gd', vim.lsp.buf.definition                            , bufopts)
				vim.keymap.set('n', '<leader>gr', vim.lsp.buf.references                            , bufopts)
				vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action                           , bufopts) -- lspconfig: <space>ca; lsp-zero: <F4>
				vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename                                , bufopts) -- lspconfig: <space>rn; lsp-zero: <F2>
			end
			local lspconfig = require('lspconfig')
			-- enable both language-servers for both eslint and typescript:
			for _, server in pairs({ 'eslint', 'tsserver' }) do
				lspconfig[server].setup({
					capabilities = lsp_capabilities,
					on_attach = lsp_on_attach,
				})
			end
		end,
		ft = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
	},

	---- indendation detection
	-- automatically configure indentation when a file is opened.

	{ 'nmac427/guess-indent.nvim' },

	---- file navigation and more

	{ 'nvim-telescope/telescope.nvim',
	dependencies = {'nvim-lua/plenary.nvim'},
	config = function()
		local builtin = require('telescope.builtin')

		vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
		vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
		vim.keymap.set('n', '<leader>fS', builtin.live_grep, {})
		vim.keymap.set('n', '<leader>fg', builtin.git_files, {})
		vim.keymap.set('n', '<leader>fq', builtin.diagnostics, {})
		vim.keymap.set('n', '<leader>fs', function()
			builtin.grep_string({ search = vim.fn.input("Grep > ") });
		end)

		require('telescope').setup({})
	end
},


-- harpoon
{
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local harpoon = require("harpoon")
		harpoon:setup()

		vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
		vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

		vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) end)
		vim.keymap.set("n", "<C-t>", function() harpoon:list():select(2) end)
		vim.keymap.set("n", "<C-n>", function() harpoon:list():select(3) end)
		vim.keymap.set("n", "<C-s>", function() harpoon:list():select(4) end)
	end,
},

-- tree-sitter

{
	'nvim-treesitter/nvim-treesitter',
	build = ':TSUpdate',
	config = function()
		require('nvim-treesitter.configs').setup({
			-- A list of parser names, or "all" (the listed parsers MUST always be installed)
			ensure_installed = { "lua", "vim", "vimdoc", "markdown", "markdown_inline" },

			-- Install parsers synchronously (only applied to `ensure_installed`)
			sync_install = false,

			-- Automatically install missing parsers when entering buffer
			-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
			auto_install = true,
		})
	end,
},

-- auto tag
{
	"windwp/nvim-ts-autotag",
	config = function()
		require("nvim-ts-autotag").setup()
	end
},

-- auto pairs
{
	'echasnovski/mini.pairs',
	branch = 'stable',
	config = function()
		require('mini.pairs').setup()
	end
},

-- comment
{
	'numToStr/Comment.nvim',
	opts = {
		-- add any options here
	},
	lazy = false,
},

-- undo tree
{
	"mbbill/undotree",
	config = function()
		vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
	end
},

-- fugitive
{
	"tpope/vim-fugitive",
	config = function()
		vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
	end
},

-- typescript tools
{
	"pmizio/typescript-tools.nvim",
	dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
	config = function()
		require("typescript-tools").setup {}
	end,
}
	},


	---- lazy (package manager)

	{
		ui = {
			-- instead of emoji-icons, use ascii-strings:
			icons = {
				cmd = 'CMD',
				config = 'CONFIG',
				event = 'EVENT',
				ft = 'FT',
				init = 'INIT',
				keys = 'KEYS',
				plugin = 'PLUGIN',
				runtime = 'RUNTIME',
				source = 'SOURCE',
				start = 'START',
				task = 'TASK',
				lazy = 'LAZY',
			},
		},
	}
	)


	-- set theme
	vim.cmd('colorscheme tokyonight-storm')


	-- OPTIONS


	vim.opt.swapfile = false
	vim.opt.backup = false
	vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
	vim.opt.undofile = true

	vim.opt.hlsearch = true
	vim.opt.incsearch = true

	vim.opt.termguicolors = true

	vim.opt.scrolloff = 8
	vim.opt.signcolumn = "yes"
	vim.opt.isfname:append("@-@")

	vim.opt.updatetime = 50

	vim.opt.colorcolumn = "80"
	-- Sync clipboard between OS and Neovim.
	vim.opt.clipboard = 'unnamedplus'

	-- wrap line after end of row
	vim.opt.wrap = true 

	-- set number and relative number
	vim.opt.nu = true
	vim.opt.relativenumber = true

	---- miscellaneous
	vim.opt.cursorline = true
	vim.opt.number = true
	vim.opt.relativenumber = true
	vim.opt.shiftwidth = 2
	vim.opt.signcolumn = 'number'
	vim.opt.smartindent = true
	vim.opt.softtabstop = 2
	vim.opt.tabstop = 2


	-- KEYMAPS


	-- move visual block up, down
	vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
	vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

	-- allows search term to stay in the middle
	vim.keymap.set("n", "n", "nzzzv")
	vim.keymap.set("n", "N", "Nzzzv")
	-- append the line below to current line
	vim.keymap.set("n", "J", "mzJ`z")
	-- preserve value when paste
	vim.keymap.set("x", "<leader>p", [["_dP]])

	-- delete without yanking
	vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

	-- auto import missing imports and remove unused
	vim.keymap.set('n', '<C-o>', '<Cmd>TSToolsOrganizeImports<CR>', { noremap = true, silent = true })

