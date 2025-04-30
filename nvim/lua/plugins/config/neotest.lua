return {
    "nvim-neotest/neotest",
    dependencies = {
        "nvim-neotest/nvim-nio",
        "nvim-lua/plenary.nvim",
        "antoinemadec/FixCursorHold.nvim",
        "nvim-treesitter/nvim-treesitter",
        "nvim-neotest/neotest-python",
        "fredrikaverpil/neotest-golang",
        "rouge8/neotest-rust",
        "rcasia/neotest-java",
        "alfaix/neotest-gtest",
    },
    config = function()
        require("neotest").setup({
            adapters = {
                require("neotest-python"),
                require("neotest-java"),
                require("neotest-gtest"),
                require("neotest-golang"),
                require("neotest-rust"),
            },
        })
        vim.keymap.set("n", "<leader>tn", function()
            require("neotest").run.run()
        end, { desc = "Run nearest test" })
        vim.keymap.set("n", "<leader>tf", function()
            require("neotest").run.run(vim.fn.expand("%"))
        end, { desc = "Run test in current file" })
        vim.keymap.set("n", "<leader>td", function()
            require("neotest").run.run({strategy = "dap"})
        end, { desc = "Debug nearest test" })
        vim.keymap.set("n", "<leader>ts", function()
            require("neotest").run.stop()
        end, { desc = "Stop nearest test" })
    end
}
