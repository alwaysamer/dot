return {
        "nvim-neorg/neorg",
        build = ":Neorg sync-parsers",
        lazy = false,
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require('neorg').setup {
                load = {
                    ["core.defaults"] = {},
                    ["core.concealer"] = {},
                    ["core.summary"] = {},
                    ["core.dirman"] = {
                        config = {
                            default_workspace = "main",
                            index = "index.norg",
                            workspaces = {
                                main = "~/notes",
                            },
                        },
                    },
                    ['core.completion'] = {
                        config = {
                            engine = 'nvim-cmp',
                        },
                    },
                },
            }
        end,
}
