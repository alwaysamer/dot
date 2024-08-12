return {
    "folke/trouble.nvim",
    cmd = "Trouble",
    config = function()
        require("trouble").setup({
            height = 6,
            include_declaration = {
                "lsp_references",
                "lsp_implementations",
                "lsp_definitions"
            },
            multiline = true,
            focus = true,
            padding = false,
            position = "bottom",
            use_diagnostic_signs = true,
        })
        vim.keymap.set("n", "gr", "<cmd>Trouble lsp_references toggle<CR>", { silent = true })
        vim.keymap.set("n", "gd", "<cmd>Trouble lsp_definitions toggle<CR>", { silent = true })
        vim.keymap.set("n", "<leader>td", "<cmd>Trouble todo toggle<CR>", { silent = true })
        vim.keymap.set("n", "<leader>xx", "<cmd>Trouble diagnostics toggle filter.buf=0<CR>", { silent = true })
        vim.keymap.set("n", "<leader>xX", "<cmd>Trouble diagnostics toggle<CR>", { silent = true })
    end,
}
