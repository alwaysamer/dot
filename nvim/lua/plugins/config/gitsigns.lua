return {
    "lewis6991/gitsigns.nvim",
    dependencies = {
        {
            "luukvbaal/statuscol.nvim",
            event = "VimEnter",
            opts = function()
                local builtin = require("statuscol.builtin")
                return {
                    relculright = true,
                    setopt = true,
                    segments = {
                        {
                            sign = {
                                name = {
                                    "Dap",
                                    "neotest",
                                },
                                maxwidth = 2,
                                auto = true
                            },
                            click = "v:lua.ScSa"
                        },
                        {
                            sign = {
                                namespace = {
                                    "diagnostic/signs"
                                },
                                maxwidth = 1,
                                auto = false
                            },
                            click = "v:lua.ScSa"
                        },
                        {
                            text = { builtin.lnumfunc, " " },
                            condition = { true, builtin.not_empty },
                            click = "v:lua.ScLa",
                        },
                        {
                            sign = {
                                namespace = { "gitsign" },
                                maxwidth = 1,
                                colwidth = 1,
                                auto = false,
                                fillchar = " ",
                                fillcharhl = "StatusColumnSeparator",
                            },
                            click = "v:lua.ScSa",
                        },
                    },
                    ft_ignore = {
                        "help",
                        "vim",
                        "alpha",
                        "dashboard",
                        "lazy",
                    },
                }
            end
        }
    },
    config = function()
        require('gitsigns').setup {
            signs                        = {
                add          = { text = '┃' },
                change       = { text = '┃' },
                delete       = { text = '_' },
                topdelete    = { text = '‾' },
                changedelete = { text = '~' },
                untracked    = { text = '┆' },
            },
            signcolumn                   = true,
            numhl                        = false,
            linehl                       = false,
            word_diff                    = false,
            watch_gitdir                 = {
                follow_files = true
            },
            auto_attach                  = true,
            attach_to_untracked          = true,
            current_line_blame           = false,
            current_line_blame_opts      = {
                virt_text = true,
                virt_text_pos = 'eol',
                delay = 1000,
                ignore_whitespace = false,
                virt_text_priority = 100,
            },
            current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
            sign_priority                = 1,
            update_debounce              = 100,
            status_formatter             = nil,
            max_file_length              = 40000,
            preview_config               = {
                border = 'single',
                style = 'minimal',
                relative = 'cursor',
                row = 0,
                col = 1
            },
        }
    end
}
