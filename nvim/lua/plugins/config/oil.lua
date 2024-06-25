return {
    'stevearc/oil.nvim',
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("oil").setup({
            default_file_explorer = true,
            skip_confirm_for_simple_edits = true,
            view_options = {
                show_hidden = true,
                natural_order = true,
                is_always_hidden = function(name, _)
                    return name == '..' or name == '.git'
                end
            },
            lsp_file_methods = {
                autosave_changes = true,
            },
            float = {
                padding = 2,
                max_width = 100,
                max_height = 0,
                preview_split = "right",
                border = "single",
                win_options = {
                    winblend = 0,
                },
            },
            preview = {
                max_width = { 50, 0.5 },
                -- min_width = {40, 0.4} means "the greater of 40 columns or 40% of total"
                min_width = { 50, 0.5 },
                -- optionally define an integer/float for the exact width of the preview window
                width = 50,
                -- Height dimensions can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
                -- min_height and max_height can be a single value or a list of mixed integer/float types.
                -- max_height = {80, 0.9} means "the lesser of 80 columns or 90% of total"
                max_height = 0.9,
                -- min_height = {5, 0.1} means "the greater of 5 columns or 10% of total"
                min_height = { 5, 0.1 },
                border = "single",
                win_options = {
                    winblend = 0,
                },
                update_on_cursor_moved = true,
            },
            keymaps_help = {
                border = "single",
            },
        })
        vim.keymap.set("n", "<leader>pv", ":Oil --float<CR>", { silent = true })
        vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#ffffff" })
    end
}
