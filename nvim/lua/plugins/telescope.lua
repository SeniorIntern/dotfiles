return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.8",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require("telescope").setup({
      pickers = {
        current_buffer_fuzzy_find = {
          previewer = false,
        },
      },
    })
  end,
}
