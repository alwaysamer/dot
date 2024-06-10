return {
    "SmiteshP/nvim-navbuddy",
    dependencies = {
        "neovim/nvim-lspconfig",
        "SmiteshP/nvim-navic",
        "MunifTanjim/nui.nvim",
    },
    config = function()
        local navbuddy = require("nvim-navbuddy")
        local navic = require("nvim-navic")
        local actions = require("nvim-navbuddy.actions")

        vim.api.nvim_set_hl(0, "CustomNavbuddyCursorline", { bg = "#ffffff", fg = "#000000" })

        navic.setup {
            icons = {
                File = ' ',
                Module = ' ',
                Namespace = ' ',
                Package = ' ',
                Class = ' ',
                Method = ' ',
                Property = ' ',
                Field = ' ',
                Constructor = ' ',
                Enum = ' ',
                Interface = ' ',
                Function = ' ',
                Variable = ' ',
                Constant = ' ',
                String = ' ',
                Number = ' ',
                Boolean = ' ',
                Array = ' ',
                Object = ' ',
                Key = ' ',
                Null = ' ',
                EnumMember = ' ',
                Struct = ' ',
                Event = ' ',
                Operator = ' ',
                TypeParameter = ' '
            }
        }
        vim.api.nvim_set_hl(0, "NavicIconsFile", { default = true, bg = "#000000", fg = "#ffffff" })
        vim.api.nvim_set_hl(0, "NavicIconsModule", { link = "@module" })
        vim.api.nvim_set_hl(0, "NavicIconsNamespace", { link = "@lsp.type.namespace" })
        vim.api.nvim_set_hl(0, "NavicIconsPackage", { link = "@module" })
        vim.api.nvim_set_hl(0, "NavicIconsClass", { link = "@lsp.type.class" })
        vim.api.nvim_set_hl(0, "NavicIconsMethod", { link = "@lsp.type.method" })
        vim.api.nvim_set_hl(0, "NavicIconsProperty", { link = "@lsp.type.property" })
        vim.api.nvim_set_hl(0, "NavicIconsField", { link = "@lsp.type.property" })
        vim.api.nvim_set_hl(0, "NavicIconsConstructor", { link = "@constructor" })
        vim.api.nvim_set_hl(0, "NavicIconsEnum", { link = "@lsp.type.enum" })
        vim.api.nvim_set_hl(0, "NavicIconsInterface", { link = "@lsp.type.interface" })
        vim.api.nvim_set_hl(0, "NavicIconsFunction", { link = "@lsp.type.function" })
        vim.api.nvim_set_hl(0, "NavicIconsVariable", { link = "@lsp.type.variable" })
        vim.api.nvim_set_hl(0, "NavicIconsConstant", { link = "@constant" })
        vim.api.nvim_set_hl(0, "NavicIconsString", { link = "@lsp.type.string" })
        vim.api.nvim_set_hl(0, "NavicIconsNumber", { link = "@lsp.type.number" })
        vim.api.nvim_set_hl(0, "NavicIconsBoolean", { link = "@boolean" })
        vim.api.nvim_set_hl(0, "NavicIconsArray", { link = "@lsp.type.variable" })
        vim.api.nvim_set_hl(0, "NavicIconsObject", { link = "@lsp.type.class" })
        vim.api.nvim_set_hl(0, "NavicIconsKey", { link = "@lsp.type.keyword" })
        vim.api.nvim_set_hl(0, "NavicIconsNull", { link = "@constant" })
        vim.api.nvim_set_hl(0, "NavicIconsEnumMember", { link = "@lsp.type.enumMember" })
        vim.api.nvim_set_hl(0, "NavicIconsStruct", { link = "@lsp.type.struct" })
        vim.api.nvim_set_hl(0, "NavicIconsEvent", { link = "@lsp.type.event" })
        vim.api.nvim_set_hl(0, "NavicIconsOperator", { link = "@lsp.type.operator" })
        vim.api.nvim_set_hl(0, "NavicIconsTypeParameter", { link = "@lsp.type.typeParameter" })
        vim.api.nvim_set_hl(0, "NavicText", { link = "Normal" })
        vim.api.nvim_set_hl(0, "NavicSeparator", { default = true, bg = "#000000", fg = "#ffffff" })



        navbuddy.setup {
            window = {
                border = "single",
                size = "60%",
                position = "50%",
                scrolloff = nil,
                sections = {
                    left = {
                        size = "20%",
                        border = nil,
                    },
                    mid = {
                        size = "40%",
                        border = nil,
                    },
                    right = {
                        border = nil,
                        preview = "leaf",
                    }
                },
            },
            node_markers = {
                enabled = true,
                icons = {
                    leaf = "  ",
                    leaf_selected = " → ",
                    branch = "  ",
                },
            },
            icons = {
                File          = "󰈙 ",
                Module        = " ",
                Namespace     = "󰌗 ",
                Package       = " ",
                Class         = "󰌗 ",
                Method        = "󰆧 ",
                Property      = " ",
                Field         = " ",
                Constructor   = " ",
                Enum          = "󰕘",
                Interface     = "󰕘",
                Function      = "󰊕 ",
                Variable      = "󰆧 ",
                Constant      = "󰏿 ",
                String        = " ",
                Number        = "󰎠 ",
                Boolean       = "◩ ",
                Array         = "󰅪 ",
                Object        = "󰅩 ",
                Key           = "󰌋 ",
                Null          = "󰟢 ",
                EnumMember    = " ",
                Struct        = "󰌗 ",
                Event         = " ",
                Operator      = "󰆕 ",
                TypeParameter = "󰊄 ",
            },
            use_default_mappings = true,
            mappings = {
                ["<esc>"] = actions.close(),
                ["q"] = actions.close(),

                ["j"] = actions.next_sibling(),
                ["k"] = actions.previous_sibling(),

                ["h"] = actions.parent(),
                ["l"] = actions.children(),
                ["0"] = actions.root(),

                ["v"] = actions.visual_name(),
                ["V"] = actions.visual_scope(),

                ["y"] = actions.yank_name(),
                ["Y"] = actions.yank_scope(),

                ["i"] = actions.insert_name(),
                ["I"] = actions.insert_scope(),

                ["a"] = actions.append_name(),
                ["A"] = actions.append_scope(),

                ["r"] = actions.rename(),

                ["d"] = actions.delete(),

                ["f"] = actions.fold_create(),
                ["F"] = actions.fold_delete(),

                ["c"] = actions.comment(),

                ["<enter>"] = actions.select(),
                ["o"] = actions.select(),

                ["J"] = actions.move_down(),
                ["K"] = actions.move_up(),

                ["s"] = actions.toggle_preview(),

                ["<C-v>"] = actions.vsplit(),
                ["<C-s>"] = actions.hsplit(),

                ["g?"] = actions.help(), -- Open mappings help window
            },
            lsp = {
                auto_attach = true,
            },
            source_buffer = {
                follow_node = true,
                highlight = false,
                reorient = "smart",
                scrolloff = nil
            },
            custom_hl_group = "CustomNavbuddyCursorline",
        }
        vim.keymap.set("n", "<leader>a", "<cmd>Navbuddy<CR>",
            { noremap = true, silent = true })
        vim.api.nvim_set_hl(0, "NavbuddyCursor", {
            link = "Visual"
        })
    end
}
