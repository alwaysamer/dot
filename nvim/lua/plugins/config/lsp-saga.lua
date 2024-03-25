return {
    'nvimdev/lspsaga.nvim',
    event = "LspAttach",
    config = function ()
        require('lspsaga').setup({
            outline = {
                win_width = 50,
            },
            lightbulb = {
                enabled = true,
                virtual_text = false
            },
        })
    end
}
