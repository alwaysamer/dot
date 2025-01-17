return {
    "scottmckendry/cyberdream.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        require("cyberdream").setup({
            transparent = true,
            borderless_telescope = false,
            italic_comments = true,
            hide_fillchars = true,
            terminal_colors = true,
            theme = {
                variant = "default",
            },
        })
        vim.cmd.colorscheme('cyberdream')
        vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#ffffff" })
    end
}
