return {
	"pmizio/typescript-tools.nvim",
	dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
	config = function()
		require("typescript-tools").setup({})
		vim.keymap.set("n", "<C-o>", "<Cmd>TSToolsOrganizeImports<CR>", { noremap = true, silent = true })
	end,
}
