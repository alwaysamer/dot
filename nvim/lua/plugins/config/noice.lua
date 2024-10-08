return {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
        "rcarriga/nvim-notify",
        "MunifTanjim/nui.nvim",
    },
    config = function()
        require("noice").setup({
            cmdline = {
                enabled = true,
                view = "cmdline_popup",
            },
            messages = {
                enabled = true,
                view = "notify",
                view_error = "notify",
                view_warn = "notify",
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
