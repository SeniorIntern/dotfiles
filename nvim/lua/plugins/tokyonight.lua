local M = {
  "folke/tokyonight.nvim",
  lazy = false, -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other start plugins
}

function M.config()
	local theme = require("tokyonight")

  theme.setup({
		style = "night",
		light_style = "night",
		transparent = false,
		terminal_colors = false,
		styles = {
			comments = { italic = true },
			keywords = { italic = true },
			functions = { italic = true },
			variables = { italic = true },
			sidebars = "dark",
			floats = "dark",
		},
		sidebars = { "qf", "help", "vista_kind", "terminal", "packer", "toggleterm" },
		day_brightness = 0,
		hide_inactive_statusline = false,
		dim_inactive = false,
		lualine_bold = false,

		on_colors = function(colors)
			colors.comment = "#687272"
			colors.green = "#6ACA79"
			colors.dark5 = "#f9f9f9"
			colors.fg_gutter = "#5a607f"
		end,

		on_highlights = function(hl, c)
			-- For HTML tag
			hl.Statement = {
				fg = c.red,
			}
			-- For HTML tag opener, closer <>
			hl.Special = {
				fg = c.red,
			}
			-- Form import statement
			hl["@constructor"] = {
				fg = c.blue2,
			}
			-- For property of tags
			hl["@property"] = {
				fg = c.magenta,
			}
			-- For context line in indentblankline
			hl.IndentBlanklineChar = {
				fg = c.terminal_black,
			}
			hl.IndentBlanklineContextChar = {
				fg = c.purple,
			}
			hl.LspReferenceText = {
				bg = "#313a5d",
			}
			-- For unused variables and stuffs
			hl.DiagnosticUnnecessary = {
				fg = c.comment,
			}
      hl.TelescopePromptBorder = {
        fg = c.border_highlight
      }
		end,
	})

	theme.load()

end

return M
