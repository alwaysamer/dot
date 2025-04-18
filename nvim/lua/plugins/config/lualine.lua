return {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function()
        return {
            options = {
                component_separators = { left = " ", right = " " },
                section_separators = { left = " ", right = " " },
                theme = "auto",
                globalstatus = true,
                disabled_filetypes = { statusline = { "dashboard", "alpha" } },
            },
            sections = {
                lualine_a = { { "mode", icon = "" } },
                lualine_b = { { "branch", icon = "" } },
                lualine_c = {
                    {
                        "diagnostics",
                        symbols = {
                            error = " ",
                            warn = " ",
                            info = " ",
                            hint = "󰝶 ",
                        },
                    },
                    { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
                    {
                        "filename",
                        symbols = { modified = "  ", readonly = "", unnamed = "" },
                    },
                },

                lualine_x = {
                    {
                        require("lazy.status").updates,
                        cond = require("lazy.status").has_updates,
                    }
                },
                lualine_y = {
                    {
                        "location",
                    },
                },
                lualine_z = {},
            },
            extensions = { "lazy", "mason", "oil", "fzf", "trouble" },
        }
    end,
}
