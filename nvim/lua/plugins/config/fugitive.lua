return {
    "tpope/vim-fugitive",
    config = function()
        vim.keymap.set("n", "<leader>gg",":0G<CR>", { silent = true, desc = "Git Diff" })
    end
}
