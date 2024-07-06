return {
    'williamboman/mason.nvim',
    build = ":MasonUpdate",
    dependencies = {
        "jay-babu/mason-nvim-dap.nvim"
    },
    config = function()
        require('mason').setup({
            ui = {
                border = "single",
                width = 0.7,
                height = 0.7,
            },
        })
        require('mason-nvim-dap').setup()
    end
}
