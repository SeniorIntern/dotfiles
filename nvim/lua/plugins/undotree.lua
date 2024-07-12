return {
  "mbbill/undotree",
  config = function()
    require("harpoon").setup({
      vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
    })
  end
}
