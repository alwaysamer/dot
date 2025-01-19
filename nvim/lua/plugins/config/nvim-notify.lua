return {
    "rcarriga/nvim-notify",
    config = function()
        require("notify").setup({
            level = vim.log.levels.WARN,
            render = "wrapped-compact",
            on_open = function(win)
                local config = vim.api.nvim_win_get_config(win)
                config.border = "single"
                vim.api.nvim_win_set_config(win, config)
            end
        })
        vim.api.nvim_set_hl(0, "NotifyERRORBorder", { link = "FloatBorder" })
        vim.api.nvim_set_hl(0, "NotifyWARNBorder", { link = "FloatBorder" })
        vim.api.nvim_set_hl(0, "NotifyINFOBorder", { link = "FloatBorder" })
        vim.api.nvim_set_hl(0, "NotifyDEBUGBorder", { link = "FloatBorder" })
        vim.api.nvim_set_hl(0, "NotifyTRACEBorder", { link = "FloatBorder" })
    end
}
