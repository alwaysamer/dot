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
        { 'folke/neodev.nvim' }
    },
    config = function()
        require("neodev").setup({
            library = { plugins = { "nvim-dap-ui" }, types = true },
        })
        local lsp = require('lsp-zero')
        lsp.preset("recommended")

        require('mason').setup({})
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
                lsp.default_setup,
            },
        })
        vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
            underline = true,
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
        vim.fn.sign_define(
            "LspDiagnosticsSignError",
            { texthl = "LspDiagnosticsSignError", text = "", numhl = "LspDiagnosticsSignError" }
        )
        vim.fn.sign_define(
            "LspDiagnosticsSignWarning",
            { texthl = "LspDiagnosticsSignWarning", text = "", numhl = "LspDiagnosticsSignWarning" }
        )
        vim.fn.sign_define(
            "LspDiagnosticsSignHint",
            { texthl = "LspDiagnosticsSignHint", text = "", numhl = "LspDiagnosticsSignHint" }
        )
        vim.fn.sign_define(
            "LspDiagnosticsSignInformation",
            { texthl = "LspDiagnosticsSignInformation", text = "", numhl = "LspDiagnosticsSignInformation" }
        )
    end
}
