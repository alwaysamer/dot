return {
    "FireIsGood/spaceman.nvim",
    config = function()
        require("spaceman").setup({
            directories = {
                "~/source"
            },
            sort_by_recent = true,
            use_default_keymaps = false,
            use_default_hooks = true,
            use_sessions = false,
            rename_function = nil,
            adapter = "vim-ui",
            hooks = {
                before_move = nil,
                after_move = function()
                    require('oil').open(vim.fn.getcwd())
                end,
            },
            data_path = vim.fn.stdpath("data") .. "/spaceman_data.json",
        })
    end,
}
