return {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {},
    config = function()
        vim.api.nvim_set_hl(0, "IblScope", { fg = "#ffffff" })
        require("ibl").setup({
            scope = {
                enabled = true,
                show_start = false,
                show_end = false,
            },
        })
        local indent_blankline_augroup = vim.api.nvim_create_augroup("indent_blankline_augroup", { clear = true })
        vim.api.nvim_create_autocmd("ModeChanged", {
            group = indent_blankline_augroup,
            pattern = "[vV\x16]*:*",
            command = "IBLEnable",
            desc = "Enable indent-blankline when exiting visual mode"
        })

        vim.api.nvim_create_autocmd("ModeChanged", {
            group = indent_blankline_augroup,
            pattern = "*:[vV\x16]*",
            command = "IBLDisable",
            desc = "Disable indent-blankline when exiting visual mode"
        })
    end,
}
