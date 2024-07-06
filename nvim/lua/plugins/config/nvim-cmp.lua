return {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-cmdline",
        "L3MON4D3/LuaSnip",
        "onsails/lspkind.nvim",
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-path',
        "zbirenbaum/copilot-cmp",
        {
            'windwp/nvim-autopairs',
            event = "InsertEnter",
            config = true

        },
    },
    config = function()
        local cmp = require("cmp")
        local kind = require("lspkind")
        local cmp_autopairs = require('nvim-autopairs.completion.cmp')
        require("copilot_cmp").setup()

        kind.init({
            symbol_map = {
                Copilot = "",
            },
        })
        vim.api.nvim_set_hl(0, "CmpItemKindCopilot", { link = "@constructor" })


        cmp.setup({
            sorting = {
                priority_weight = 2,
                comparators = {
                    require("copilot_cmp.comparators").prioritize,
                    cmp.config.compare.offset,
                    cmp.config.compare.exact,
                    cmp.config.compare.score,
                    cmp.config.compare.recently_used,
                    cmp.config.compare.locality,
                    cmp.config.compare.kind,
                    cmp.config.compare.sort_text,
                    cmp.config.compare.length,
                    cmp.config.compare.order,
                }
            },
            formatting = {
                fields = { 'kind', 'abbr', 'menu' },
                format = kind.cmp_format({
                    menu = {},
                    mode = 'symbol',
                    maxwidth = 20,
                    ellipsis_char = '…',
                    show_labelDetails = true,
                    before = function(_, vim_item)
                        vim_item.menu = nil
                        return vim_item
                    end
                }),
            },
            view = {
                entries = {
                    follow_cursor = true
                },
                docs = {
                    auto_open = false,
                },
            },
            mapping = {
                ["<c-space>"] = cmp.mapping {
                    i = cmp.mapping.complete(),
                },
                ['<C-g>'] = function()
                    if cmp.visible_docs() then
                        cmp.close_docs()
                    else
                        cmp.open_docs()
                    end
                end,
                ["<TAB>"] = cmp.mapping {
                    i = cmp.mapping.confirm {
                        behavior = cmp.ConfirmBehavior.Insert,
                        select = true,
                    },
                },
                ["<c-n>"] = cmp.mapping {
                    i = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
                },
                ["<c-p>"] = cmp.mapping {
                    i = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
                },
            },
            completion = {
                autcomplete = true,
                completeopt = 'menu,menuone,noinsert',
            },
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body)
                end,
            },
            preselect = cmp.PreselectMode.None,
            window = {
                completion = {
                    border = "single",
                    scrollbar = false,
                },
                documentation = {
                    border = "single",
                    scrollbar = true,
                    maxwidth = 80,
                    maxheight = 40,
                },
            },
            sources = cmp.config.sources({
                { name = "copilot",  group_index = 2 },
                { name = 'nvim_lsp', group_index = 2 },
                { name = 'luasnip',  group_index = 2 },
            })
        })

        cmp.setup.cmdline({ "/", "?" }, {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
                { name = "buffer" },
            },
        })

        cmp.setup.cmdline(':', {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
                { name = 'path' }
            }, {
                {
                    name = 'cmdline',
                    option = {
                        ignore_cmds = { 'Man', '!' }
                    }
                }
            })
        })

        cmp.event:on(
            'confirm_done',
            cmp_autopairs.on_confirm_done()
        )
    end,
}
