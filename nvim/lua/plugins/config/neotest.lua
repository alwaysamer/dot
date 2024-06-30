return {
    "nvim-neotest/neotest",
    dependencies = {
        "nvim-neotest/nvim-nio",
        "nvim-lua/plenary.nvim",
        "nvim-neotest/neotest-plenary",
        "nvim-neotest/neotest-python",
        "rcasia/neotest-java",
        "antoinemadec/FixCursorHold.nvim",
        "nvim-treesitter/nvim-treesitter",
        "nvim-neotest/neotest-go",
        "rouge8/neotest-rust",
    },
    config = function()
        require("neotest").setup({
            adapters = {
                require("neotest-go"),
                require("neotest-plenary"),
                require("neotest-java")({
                    ignore_wrapper = false,
                }),
                require("neotest-python"),
                require("neotest-rust"),
            }
        })
        vim.keymap.set("n", "<leader>vrt", "<cmd>lua require('neotest').run.run()<CR>",
            { silent = true, desc = "Neotest Run Test" })
        vim.keymap.set("n", "<leader>vrs", "<cmd>lua require('neotest').run.stop()<CR>",
            { silent = true, desc = "Neotest Stop Test" })
        vim.keymap.set("n", "<leader>vrf", "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<CR>",
            { silent = true, desc = "Neotest Run File" })
    end
}
