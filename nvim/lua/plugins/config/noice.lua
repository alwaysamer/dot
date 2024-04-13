return
{
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
        "MunifTanjim/nui.nvim",
        "rcarriga/nvim-notify",
    },
    config = function()
        require("notify").setup({
            level = vim.log.levels.INFO,
            timeout = 1500,
            render = "minimal",
            minimum_width = 50,
            fps = 60,
            top_down = true,
        })
        require("noice").setup({
            lsp = {
                progress = {
                    enabled = false,
                },
                override = {
                    ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                    ["vim.lsp.util.stylize_markdown"] = true,
                    ["cmp.entry.get_documentation"] = true,
                },
                signature = {
                    auto_open = {
                        enabled = false,
                    }
                },
            },
            messages = {
                enabled = false,
            },
            cmdline = {
                view = "cmdline_popup",
            },
            presets = {
                bottom_search = false,
                command_palette = false,
                long_message_to_split = true,
                inc_rename = false,
                lsp_doc_border = false,
            },
        })
    end
}
