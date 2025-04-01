return {
    'williamboman/mason.nvim',
    config = function()
        require("mason").setup({
            ui = {
                border = "single",
                width = 0.7,
                height = 0.7,
            },
        })
        local on_attach = function(client, bufnr)
            if client.supports_method("textDocument/signatureHelp") then
                local custom_signature = function()
                    local signature_opts = {
                        max_width = 80,
                        max_height = 40,
                    }
                    vim.lsp.buf.signature_help(signature_opts)
                end
                vim.api.nvim_buf_set_keymap(bufnr, 'i', '<C-h>', '', {
                    noremap = true,
                    silent = true,
                    callback = custom_signature,
                })
            end

            if client.supports_method("textDocument/hover") then
                local custom_hover = function()
                    local hover_opts = {
                        max_width = 80,
                        max_height = 40,
                    }
                    vim.lsp.buf.hover(hover_opts)
                end
                vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '', {
                    noremap = true,
                    silent = true,
                    callback = custom_hover,
                })
            end
            vim.keymap.set("n", "gn", function() vim.lsp.buf.rename() end,
                { silent = true, desc = "LSP Rename" })
            vim.keymap.set("n", "gC", function() vim.lsp.buf.code_action() end,
                { silent = true, desc = "LSP Code Actions" })
            vim.keymap.set("n", "gf", function()
                vim.lsp.buf.format()
            end, { silent = true, desc = "LSP Format" })
        end
        vim.lsp.config(
            '*',
            {
                on_attach = on_attach,
            }
        )

        vim.lsp.enable({
            "luals",
            "docker_compose",
            "dockerls",
            "gopls",
            "rust_analyzer",
            "pylsp",
            "yamlls",
            "html",
            "tsls"
        })

        vim.diagnostic.config({
            underline = true,
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
