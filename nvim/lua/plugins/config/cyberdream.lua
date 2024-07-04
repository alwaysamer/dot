return {
    "scottmckendry/cyberdream.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        require("cyberdream").setup({
            transparent = true,
            italic_comments = true,
            hide_fillchars = true,
            terminal_colors = true,
            theme = {
                variant = "default",
            },
        })
        vim.cmd.colorscheme('cyberdream')
    end
}
