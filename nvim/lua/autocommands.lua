local autocmd = vim.api.nvim_create_autocmd

autocmd("LspAttach", {
    callback = function(e)
        vim.keymap.set("n", "grd", vim.lsp.buf.definition, {
            buffer = e.buf,
            desc = "LSP: Go to Definition",
        })
    end,
})
