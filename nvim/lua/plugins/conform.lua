return {
	"stevearc/conform.nvim",
	opts = {},
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				javascript = { "prettier" },
				javascriptreact = { "prettier" },
				typescriptreact = { "prettier" },
				vue = { "prettier" },
				html = { "prettier" },
				css = { "prettier" },
				csss = { "prettier" },
				json = { "prettier" },
				python = { "isort", "black" },
			},
		})

		vim.keymap.set("n", "<leader>cf", function()
			require("conform").format({ bufnr = 0 })
		end)
	end,
}
