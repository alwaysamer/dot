return {
    "rcarriga/nvim-notify",
    event = "VeryLazy",
    config = function()
        require("notify").setup({
            level = vim.log.levels.INFO,
            render = "wrapped-compact",
            max_width = 40,
            max_height = 40,
            fps = 120,
            timeout = 500,
            on_open = function(win)
                local config = vim.api.nvim_win_get_config(win)
                config.border = "single"
                vim.api.nvim_win_set_config(win, config)
            end
        })
    end
}
