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
                min_width = { 50, 0.5 },
                width = 50,
                max_height = 0.9,
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
        vim.keymap.set("n", "<leader>pv", ":Oil --float<CR>", { silent = true, desc = "Oil Toggle" })
        vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#ffffff" })
    end
}
