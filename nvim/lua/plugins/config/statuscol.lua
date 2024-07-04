return {
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
