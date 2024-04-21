return {
    "HakonHarnes/zen-mode.nvim",
    config = function()
        require("zen-mode").setup {
            window = {
                backdrop = 1,
                width = 120,
                options = {
                    signcolumn = "yes",
                    number = true,
                    relativenumber = true,
                },
            },
        }
        vim.keymap.set("n", "<leader>zz", function()
            require("zen-mode").toggle()
        end)
    end
}
