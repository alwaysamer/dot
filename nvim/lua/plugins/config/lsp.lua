return {
    'neovim/nvim-lspconfig',
    dependencies = {
        { 'williamboman/mason-lspconfig.nvim' },
        { 'hrsh7th/cmp-nvim-lsp' },
        { 'folke/neodev.nvim' },
    },
    event = "BufReadPre",
    config = function()
        require("neodev").setup({
            library = { types = true, plugins = { "neotest" } },
        })
        local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()
        local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
        local format = function(client, bufnr)
            if client.supports_method("textDocument/formatting") then
                vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
                vim.api.nvim_create_autocmd("BufWritePre", {
                    group = augroup,
                    buffer = bufnr,
                    callback = function()
                        vim.lsp.buf.format()
                    end
                })
            end
        end
        local default_setup = function(server)
            require('lspconfig')[server].setup({
                capabilities = lsp_capabilities,
                on_attach = format,
            })
        end
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
                lua_ls = function()
                    require('lspconfig').lua_ls.setup({
                        capabilities = lsp_capabilities,
                        on_attach = format,
                        settings = {
                            Lua = {
                                hint = {
                                    enable = true
                                }
                            }
                        }
                    })
                end,
                tsserver = function()
                    require('lspconfig').tsserver.setup({
                        capabilities = lsp_capabilities,
                        on_attach = format,
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
                        on_attach = format,
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
                        on_attach = format,
                        root_dir = require('lspconfig').util.root_pattern("go.mod", "go.mod", ".git"),
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

        vim.api.nvim_create_autocmd('LspAttach', {
            desc = 'LSP actions',
            callback = function()
                vim.keymap.set("n", "gn", function() vim.lsp.buf.rename() end,
                    { silent = true, desc = "LSP Rename" })
                vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end,
                    { silent = true, desc = "LSP Toggle Signaure-Help" })
                vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end,
                    { silent = true, desc = "LSP Go to definition" })
                vim.keymap.set("n", "<leader>vi", function()
                    vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({}))
                end, { desc = "LSP Toggle Inlay-Hints" })
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

        local signs = { Error = " ", Warn = " ", Hint = "󰝶 ", Info = " " }
        for type, icon in pairs(signs) do
            local hl = "DiagnosticSign" .. type
            vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
        end
        vim.lsp.inlay_hint.enable(false)
    end
}
