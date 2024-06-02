return {
    'stevearc/oil.nvim',
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("oil").setup({
            default_file_explorer = true,
            float = {
                padding = 2,
                max_width = 50,
                max_height = 0,
                border = "single",
                win_options = {
                    winblend = 0,
            },
        }
    })
        vim.keymap.set("n", "<leader>pv", ":Oil --float<CR>", { silent = true })
    end
}
