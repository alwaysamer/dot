return {
    'stevearc/oil.nvim',
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("oil").setup({
            default_file_explorer = true,
            delete_to_trash = true,
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
                max_width = 50,
                max_height = 0,
                border = "single",
                win_options = {
                    winblend = 0,
                },
            }
        })
        vim.keymap.set("n", "<leader>pv", ":Oil --float<CR>", { silent = true })
        vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#ffffff" })
    end
}
