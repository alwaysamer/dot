return {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
        "rcarriga/nvim-notify",
        "MunifTanjim/nui.nvim",
    },
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
        vim.api.nvim_set_hl(0, "NotifyERRORBorder", { link = "FloatBorder" })
        vim.api.nvim_set_hl(0, "NotifyWARNBorder", { link = "FloatBorder" })
        vim.api.nvim_set_hl(0, "NotifyINFOBorder", { link = "FloatBorder" })
        vim.api.nvim_set_hl(0, "NotifyDEBUGBorder", { link = "FloatBorder" })
        vim.api.nvim_set_hl(0, "NotifyTRACEBorder", { link = "FloatBorder" })

        require("noice").setup({
            cmdline = {
                enabled = true,
                view = "cmdline_popup",
            },
            messages = {
                enabled = false,
                view = "notify",
                view_error = "notify",
                view_warn = "notify",
                view_search = false,
                view_history = false,
            },
            popupmenu = {
                enabled = true,
                backend = "cmp",
                kind_icons = {},
            },
            views = {
                cmdline_popup = {
                    border = {
                        style = "single",
                    },
                },
            },
            notify = {
                enabled = true,
                view = "notify",
            },
            lsp = {
                progress = {
                    enabled = false,
                },
                override = {
                    ["vim.lsp.util.convert_input_to_markdown_lines"] = false,
                    ["vim.lsp.util.stylize_markdown"] = false,
                    ["cmp.entry.get_documentation"] = false,
                },
                hover = {
                    enabled = false,
                },
                signature = {
                    enabled = false,
                },
                message = {
                    enabled = false,
                },
            },
            health = {
                checker = false,
            },
            presets = {
                bottom_search = false,
                command_palette = false,
                long_message_to_split = false,
                inc_rename = false,
                lsp_doc_border = false,
            },
        })
        vim.api.nvim_set_hl(0, "NoiceCmdlinePopup", { link = "NormalFloat" })
        vim.api.nvim_set_hl(0, "NoiceCmdlinePopupTitle", { link = "FloatTitle" })
        vim.api.nvim_set_hl(0, "NoiceCmdlinePopupBorder", { link = "FloatBorder" })
        vim.api.nvim_set_hl(0, "NoiceCmdlinePopupBorderSearch", { link = "FloatBorder" })
    end
}
