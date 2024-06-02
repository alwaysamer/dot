return {
    'stevearc/aerial.nvim',
    opts = {},
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-tree/nvim-web-devicons"
    },
    config = function()
        require("aerial").setup({
            backends = { "lsp", "treesitter", "markdown", "asciidoc", "man" },
            layout = {
                max_width = { 40, 0.2 },
                width = nil,
                min_width = 40,
                default_direction = "prefer_right",
                placement = "window",
                resize_to_content = true,
                preserve_equality = false,
            },
            on_attach = function(bufnr)
                vim.keymap.set("n", "<c-p>", "<cmd>AerialPrev<CR>", { buffer = bufnr })
                vim.keymap.set("n", "<c-n>", "<cmd>AerialNext<CR>", { buffer = bufnr })
            end,
        })
        vim.keymap.set("n", "<leader>a", "<cmd>AerialToggle!<CR>")
    end
}
