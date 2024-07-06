return {
    "folke/trouble.nvim",
    opts = {},
    cmd = "Trouble",
    keys = {
        {
            "<leader>xX",
            "<cmd>Trouble diagnostics toggle<cr>",
            desc = "Trouble Diagnostics (Workspace)",
        },
        {
            "<leader>xx",
            "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
            desc = "Trouble Diagnostics (Buffer)",
        },
        {
            "gD",
            "<cmd>Trouble lsp_definitions toggle focus=false win.position=bottom<cr>",
            desc = "LSP Definitions (Trouble)",
        },
        {
            "gR",
            "<cmd>Trouble lsp_references toggle focus=false win.position=bottom<cr>",
            desc = "LSP References (Trouble)",
        },
        {
            "gI",
            "<cmd>Trouble lsp_implementations toggle focus=false win.position=bottom<cr>",
            desc = "LSP References (Trouble)",
        },
        {

            "<c-j>",
            function()
                require("trouble").next({
                    jump = true,
                })
            end,
            desc = "Trouble Next",
        },
        {

            "<c-k>",
            function()
                require("trouble").prev({
                    jump = true,
                })
            end,
            desc = "Trouble Previous",
        },
    },
}
