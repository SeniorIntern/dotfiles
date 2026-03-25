return {
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
		config = function()
			-- vim.cmd([[colorscheme tokyonight-moon]])
		end,
	},
	{
		"rose-pine/neovim",
		name = "rose-pine",
		config = function()
			require("rose-pine").setup({
				disable_background = false,
				styles = {
					italic = false,
				},
			})
			-- vim.cmd.colorscheme("rose-pine-moon")
		end,
	},
	{
		"olimorris/onedarkpro.nvim",
		priority = 1000,
		config = function()
			-- vim.cmd("colorscheme onedark")
		end,
	},
	{
		"sainnhe/gruvbox-material",
		lazy = false,
		priority = 1000,
		config = function()
			vim.g.gruvbox_material_better_performance = "1"
			vim.g.gruvbox_material_foreground = "material" -- Available values:   `'material'`, `'mix'`, `'original'`
			vim.g.gruvbox_material_background = "soft" -- Available values:   `'hard'`, `'medium'`, `'soft'`
			vim.g.gruvbox_material_ui_contrast = "low" -- Available values:   `'low'`, `'high'`
			vim.g.gruvbox_material_float_style = "dim"
			vim.g.gruvbox_material_statusline_style = "mix"
			vim.g.gruvbox_material_cursor = "auto"
			vim.g.gruvbox_material_dim_inactive_windows = 1
			vim.cmd.colorscheme("gruvbox-material")
		end,
	},
}
