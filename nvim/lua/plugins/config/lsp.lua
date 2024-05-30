return {
    'neovim/nvim-lspconfig',
    dependencies = {
        { 'williamboman/mason.nvim', },
        { 'williamboman/mason-lspconfig.nvim' },
        {
            'windwp/nvim-autopairs',
            event = "InsertEnter",
            config = true

        },
        {"jay-babu/mason-nvim-dap.nvim"},
        { 'onsails/lspkind.nvim' },
        { 'hrsh7th/nvim-cmp' },
        { 'hrsh7th/cmp-nvim-lsp' },
        { 'hrsh7th/cmp-buffer' },
        { 'hrsh7th/cmp-cmdline' },
        {
            'L3MON4D3/LuaSnip',
            build = "make install_jsregexp",
        },
        { 'folke/neodev.nvim' },
    },
    config = function()
        require("neodev").setup({
            library = { types = true, plugins = { "neotest" } },
        })
        local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()
        local default_setup = function(server)
            require('lspconfig')[server].setup({
                capabilities = lsp_capabilities,
            })
        end

        require('mason').setup({})
        require('mason-nvim-dap').setup()
        require('mason-lspconfig').setup({
            automatic_installation = true,
            ensure_installed = {
                'tsserver',
                'rust_analyzer',
                'gopls',
                'pylsp',
                'lua_ls',
            },
            handlers = {
                default_setup,
                tsserver = function()
                    require('lspconfig').tsserver.setup({
                        capabilities = lsp_capabilities,
                        settings = {
                            javascript = {
                                inlayHints = {
                                    includeInlayEnumMemberValueHints = true,
                                    includeInlayFunctionLikeReturnTypeHints = true,
                                    includeInlayFunctionParameterTypeHints = true,
                                    includeInlayParameterNameHints = "all",
                                    includeInlayParameterNameHintsWhenArgumentMatchesName = true,
                                    includeInlayPropertyDeclarationTypeHints = true,
                                    includeInlayVariableTypeHints = true,
                                },
                            },

                            typescript = {
                                inlayHints = {
                                    includeInlayEnumMemberValueHints = true,
                                    includeInlayFunctionLikeReturnTypeHints = true,
                                    includeInlayFunctionParameterTypeHints = true,
                                    includeInlayParameterNameHints = "all",
                                    includeInlayParameterNameHintsWhenArgumentMatchesName = true,
                                    includeInlayPropertyDeclarationTypeHints = true,
                                    includeInlayVariableTypeHints = true,
                                },
                            },
                        }
                    })
                end,
                rust_analyzer = function()
                    require('lspconfig').rust_analyzer.setup({
                        capabilities = lsp_capabilities,
                        settings = {
                            ["rust-analyzer"] = {
                                inlayHints = {
                                    enable = true,
                                    chainingHints = true,
                                    typeHints = true,
                                    parameterHints = true,
                                    maxLength = 80,
                                },
                            },
                        },
                    })
                end,
                gopls = function()
                    require('lspconfig').gopls.setup({
                        capabilities = lsp_capabilities,
                        settings = {
                            gopls = {
                                hints = {
                                    assignVariableTypes = true,
                                    compositeLiteralFields = true,
                                    compositeLiteralTypes = true,
                                    constantValues = true,
                                    functionTypeParameters = true,
                                    parameterNames = true,
                                    rangeVariableTypes = true,
                                }
                            },
                        },
                    })
                end,
            },
        })

        local kind = require('lspkind')
        kind.init({})

        local cmp = require('cmp')
        cmp.setup({
            formatting = {
                format = kind.cmp_format({
                    mode = 'symbol_text',
                    maxwidth = 50,
                    ellipsis_char = '…',
                    show_labelDetails = true,
                }),
            },
            view = {
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
                    i = cmp.mapping.select_next_item(),
                },
                ["<c-p>"] = cmp.mapping {
                    i = cmp.mapping.select_prev_item(),
                },
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
                { name = 'nvim_lsp' },
                { name = 'luasnip' },
                { name = 'buffer' },
            })
        })

        cmp.setup.cmdline('/', {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
                { name = 'buffer' }
            }
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

        local cmp_autopairs = require('nvim-autopairs.completion.cmp')
        cmp.event:on(
            'confirm_done',
            cmp_autopairs.on_confirm_done()
        )

        vim.api.nvim_create_autocmd('LspAttach', {
            desc = 'LSP actions',
            callback = function(event)
                local opts = { buffer = event.buf }
                vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
                vim.keymap.set("n", "<C-j>", function() vim.diagnostic.goto_next() end, opts)
                vim.keymap.set("n", "<C-k>", function() vim.diagnostic.goto_prev() end, opts)
                vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
                vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
                vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
                vim.keymap.set("n", "<leader>vi",
                    function() vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled()) end, opts)
                vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
            end
        })

        local _border = "single"

        vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
            vim.lsp.handlers.hover, {
                max_width = 80,
                maxheight = 40,
                border = _border
            }
        )

        vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
            vim.lsp.handlers.signature_help, {
                maxwidth = 80,
                maxheight = 40,
                border = _border
            }
        )

        vim.diagnostic.config({

            underline = true,
            float = { border = _border },
            virtual_text = false,
            signs = true,
        })
        vim.lsp.inlay_hint.enable(true)
    end
}
