return {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    dependencies = {
        { 'neovim/nvim-lspconfig' },
        {
            'williamboman/mason.nvim',
            build = function()
                pcall(vim.cmd, 'MasonUpdate')
            end,
        },
        { 'williamboman/mason-lspconfig.nvim' },
        { 'hrsh7th/nvim-cmp' },
        { 'hrsh7th/cmp-nvim-lsp' },
        { 'L3MON4D3/LuaSnip' },
    },
    config = function ()
        local lsp = require('lsp-zero')
        lsp.preset("recommended")
        require('mason').setup({})
        require('mason-lspconfig').setup({
            ensure_installed = {
	              'tsserver',
	              'eslint',
	              'lua_ls',
                  'gopls',
	              'rust_analyzer',
                  'omnisharp',
                  'pylsp',
            }

        })

        lsp.configure('lua_ls', {
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { 'vim' }
                    }
                }
            }
        })

        local cmp = require('cmp')
        cmp.setup({
            completion = {
              completeopt = 'menu,menuone,noinsert',
            },
            window = {
              completion = cmp.config.window.bordered(),
              documentation = cmp.config.window.bordered(),
            },
        })

        local cmp_autopairs = require('nvim-autopairs.completion.cmp')
        cmp.event:on(
            'confirm_done',
            cmp_autopairs.on_confirm_done()
        )

        lsp.on_attach(function(_,bufnr)
	        local opts = { buffer = bufnr, remap = false }
	        vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
	        vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
	        vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
	        vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
	        vim.keymap.set("n", "<shift>i", function() vim.diagnostic.goto_prev() end, opts)
	        vim.keymap.set("n", "<shift>o", function() vim.diagnostic.goto_next() end, opts)
	        vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
	        vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
	        vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
	        vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
        end)
        lsp.setup()
        require("lspconfig").dartls.setup({
                cmd = { "dart", "language-server", "--protocol=lsp" },
                filetypes = { "dart" },
                init_options = {
                    closingLabels = true,
                    flutterOutline = true,
                    onlyAnalyzeProjectsWithOpenFiles = true,
                    outline = true,
                    suggestFromUnimportedLibraries = true,
                },
                settings = {
                    dart = {
                        completeFunctionCalls = true,
                        showTodos = true,
                    },
                },
            })
        end
}
