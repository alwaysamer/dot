return {
    "mawkler/modicator.nvim",
    config = function()
        vim.o.termguicolors = true
        vim.o.cursorline = true
        vim.o.number = true

        require("modicator").setup()
    end
}
