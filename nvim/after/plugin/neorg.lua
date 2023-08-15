require('neorg').setup {
    load = {
        ["core.defaults"] = {},
        ["core.dirman"] = {
            config = {
                default_workspace = "main",
                workspaces = {
                    main = "~/notes",
                }
            }
        },
        ["core.summary"] = {
            config = {
                strategy = "default",
            }
        },
        ["core.concealer"] = {
            config = {
                folds = false,
                icon_preset = "diamond",
            }
        },
        ["core.keybinds"] = {
            config = {
                default_keybinds = true
            }
        },
    }
}
