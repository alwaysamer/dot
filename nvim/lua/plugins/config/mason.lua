return {
    'williamboman/mason.nvim',
    build = ":MasonUpdate",
    config = function()
        require('mason').setup({
            ui = {
                border = "single",
                width = 0.7,
                height = 0.7,
            },
        })
    end
}
