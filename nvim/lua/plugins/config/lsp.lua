return {
    'neovim/nvim-lspconfig',
    dependencies = {
        { 'williamboman/mason-lspconfig.nvim' },
    },
    event = "BufReadPre",
    config = function()
        local default_setup = function(server)
            require('lspconfig')[server].setup({})
        end
        require('mason-lspconfig').setup({
            automatic_installation = true,
            ensure_installed = {
                'ts_ls',
                'rust_analyzer',
                'gopls',
                'pylsp',
                'lua_ls',
            },
            handlers = {
                default_setup,
            },
        })

        vim.api.nvim_create_autocmd('LspAttach', {
            desc = 'LSP actions',
            callback = function()
                vim.keymap.set("n", "gn", function() vim.lsp.buf.rename() end,
                    { silent = true, desc = "LSP Rename" })
                vim.keymap.set("n", "gc", function() vim.lsp.buf.code_action() end,
                    { silent = true, desc = "LSP Code Actions" })
                vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end,
                    { silent = true, desc = "LSP Toggle Signaure-Help" })
                vim.keymap.set("n", "gf", function()
                    vim.lsp.buf.format()
                end, { silent = true, desc = "LSP Format" })
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
    end
}
