return {
    "folke/trouble.nvim",
    opts = {},
    cmd = "Trouble",
    keys = {
        {
            "<leader>xX",
            "<cmd>Trouble diagnostics toggle<cr>",
            desc = "Diagnostics (Trouble)",
        },
        {
            "<leader>xx",
            "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
            desc = "Buffer Diagnostics (Trouble)",
        },
        {
            "<leader>cs",
            "<cmd>Trouble symbols toggle focus=false auto_jump=true win.size=0.4 win.border=single<cr>",
            desc = "Symbols (Trouble)",
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
