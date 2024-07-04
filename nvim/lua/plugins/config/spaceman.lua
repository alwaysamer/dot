return {
    "FireIsGood/spaceman.nvim",
    config = function()
        require("spaceman").setup({
            directories = {
                "~/source"
            },
            workspaces = {
                { "nvim-data",      "~/.local/share/nvim" },
                { "nvim-config",    "~/.config/nvim" },
                { "wezterm-config", "~/.config/wezterm" }
            },
            sort_by_recent = true,
            use_default_keymaps = false,
            use_default_hooks = true,
            use_sessions = false,
            rename_function = nil,
            adapter = "vim-ui",
            hooks = {
                before_move = nil,
                after_move = nil,
            },
            telescope_opts = nil,
            data_path = vim.fn.stdpath("data") .. "/spaceman_data.json",
            sessions_path = vim.fn.stdpath("data") .. "/sessions",
        })
    end,
}
