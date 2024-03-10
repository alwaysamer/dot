return {
    "nvim-neorg/neorg",
    build = ":Neorg sync-parsers",
    dependencies = {
        "nvim-lua/plenary.nvim"
    },
    config = function ()
        require('neorg').setup {
            load = {
                ["core.defaults"] = {},
                ["core.concealer"] = {},
                ["core.summary"] = {},
                ["core.dirman"] = {
                    config = {
                        default_workspace = "notes",
                        workspaces = {
                            notes = "~/notes",
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
    end
}
