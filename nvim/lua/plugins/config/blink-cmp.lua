return {
    "saghen/blink.cmp",
    lazy = false,
    dependencies = {
        {
            'L3MON4D3/LuaSnip', version = 'v2.*'
        },
        {
            "giuxtaposition/blink-cmp-copilot",
        },
    },
    version = '*',
    config = function()
        require("blink.cmp").setup({
            sources = {
                default = { "lazydev","lsp", "path", "snippets", "buffer", "copilot" },
                providers = {
                    lazydev = {
                        name = "LazyDev",
                        module = "lazydev.integrations.blink",
                        score_offset = 100,
                    },
                    copilot = {
                        name = "copilot",
                        module = "blink-cmp-copilot",
                        score_offset = 100,
                        async = true,
                        transform_items = function(_, items)
                            local CompletionItemKind = require("blink.cmp.types").CompletionItemKind
                            local kind_idx = #CompletionItemKind + 1
                            CompletionItemKind[kind_idx] = "Copilot"
                            for _, item in ipairs(items) do
                                item.kind = kind_idx
                            end
                            return items
                        end,

                    },
                },
            },
            appearance = {
                kind_icons = {
                    Copilot = "",
                    Text = '󰉿',
                    Method = '󰊕',
                    Function = '󰊕',
                    Constructor = '󰒓',

                    Field = '󰜢',
                    Variable = '󰆦',
                    Property = '󰖷',

                    Class = '󱡠',
                    Interface = '󱡠',
                    Struct = '󱡠',
                    Module = '󰅩',

                    Unit = '󰪚',
                    Value = '󰦨',
                    Enum = '󰦨',
                    EnumMember = '󰦨',

                    Keyword = '󰻾',
                    Constant = '󰏿',

                    Snippet = '󱄽',
                    Color = '󰏘',
                    File = '󰈔',
                    Reference = '󰬲',
                    Folder = '󰉋',
                    Event = '󱐋',
                    Operator = '󰪚',
                    TypeParameter = '󰬛',
                },
            },
            completion = {
                menu = {
                    scrollbar = false,
                    border = {
                        "┌",
                        "─",
                        "┐",
                        "│",
                        "┘",
                        "─",
                        "└",
                        "│",
                    },
                },
                documentation = {
                    auto_show = false,
                    window = {
                        border = {
                            "┌",
                            "─",
                            "┐",
                            "│",
                            "┘",
                            "─",
                            "└",
                            "│",
                        },
                    },
                },
            },
        })
    end,
}
