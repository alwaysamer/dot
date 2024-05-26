return {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    dependencies = {
        { 'neovim/nvim-lspconfig' },
        -- {
        --     "scalameta/nvim-metals",
        --     ft = { "scala", "sbt", "java" },
        --     dependencies = {
        --         "nvim-lua/plenary.nvim",
        --     },
        --     opts = function()
        --         local metals_config = require("metals").bare_config()
        --         metals_config.on_attach = function(client, bufnr)
        --         end
        --
        --         return metals_config
        --     end,
        --     config = function(self, metals_config)
        --         local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
        --         vim.api.nvim_create_autocmd("FileType", {
        --             pattern = self.ft,
        --             callback = function()
        --                 require("metals").initialize_or_attach(metals_config)
        --             end,
        --             group = nvim_metals_group,
        --         })
        --     end
        -- },
        { 'williamboman/mason.nvim', },
        { 'williamboman/mason-lspconfig.nvim' },
        {
            'windwp/nvim-autopairs',
            event = "InsertEnter",
            config = true

        },
        { 'onsails/lspkind.nvim' },
        { 'hrsh7th/nvim-cmp' },
        { 'hrsh7th/cmp-nvim-lsp' },
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

        local kind = require('lspkind')
        kind.init({})

        local cmp = require('cmp')
        cmp.setup({
            completion = {
                completeopt = 'menu,menuone,noinsert',
            },
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
                    border = "rounded",
                    scrollbar = false,
                },
                documentation = {
                    border = "rounded",
                    scrollbar = true,
                    maxwidth = 80,
                    maxheight = 40,
                },
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
            vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
            vim.keymap.set("n", "<C-j>", function() vim.diagnostic.goto_next() end, opts)
            vim.keymap.set("n", "<C-k>", function() vim.diagnostic.goto_prev() end, opts)
            vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
            vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
            vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
            vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
        end)

        lsp.setup()

        vim.diagnostic.config({
            underline = true,
            virtual_text = false,
            signs = true,
        })
    end
}
