return {
    "tpope/vim-fugitive",
    config = function()
        vim.keymap.set("n", "<leader>gP", ":Git push<CR>",
            { silent = true, desc = "Git Push" })
        vim.keymap.set("n", "<leader>gp", ":Git pull<CR>",
            { silent = true, desc = "Git pull" })
    end
}
