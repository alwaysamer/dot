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
            formatting = {
                fields = { "abbr", "menu", "kind" },
                format = function(entry, item)
                    local menu_icon = {
                        nvim_lsp = "LSP",
                        nvim_lua = "LUA",
                        luasnip  = "SNP",
                        buffer   = "BUFF",
                        path     = "PATH",
                    }
                    item.menu = menu_icon[entry.source.name]
                    fixed_width = fixed_width or false
                    local content = item.abbr
                    if fixed_width then
                        vim.o.pumwidth = fixed_width
                    end
                    local win_width = vim.api.nvim_win_get_width(0)
                    local max_content_width = fixed_width and fixed_width - 10 or math.floor(win_width * 0.2)

                    if #content > max_content_width then
                        item.abbr = vim.fn.strcharpart(content, 0, max_content_width - 3) .. "..."
                    else
                        item.abbr = content .. (" "):rep(max_content_width - #content)
                    end
                    return item
                end,
            },
            completion = {
                completeopt = 'menu,menuone,noinsert',
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
            },
            preselect = cmp.PreselectMode.None,
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.disable,
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
                    completeFunctionCalls = false,
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
