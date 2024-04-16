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
        {
            'L3MON4D3/LuaSnip',
            build = "make install_jsregexp",
        },
        { 'folke/neodev.nvim' }
    },
    config = function()
        require("neodev").setup({
            library = { types = true },
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
        local cmp = require('cmp')
        cmp.setup({
            formatting = {
                fields = { "abbr", "kind" },
                format = function(entry, item)
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
                ["<c-y>"] = cmp.mapping {
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
        lsp.on_attach(function(client, bufnr)
            local opts = { buffer = bufnr, remap = false }
            vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
            vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
            vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
            vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
            vim.keymap.set("n", "<C-j>", function() vim.diagnostic.goto_next() end, opts)
            vim.keymap.set("n", "<C-k>", function() vim.diagnostic.goto_prev() end, opts)
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
                    completeFunctionCalls = false,
                    showTodos = true,
                },
            },
        })

        vim.diagnostic.config({
            underline = true,
            virtual_text = false,
            signs = true,
        })
    end
}
