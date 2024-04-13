return {
    'nvimdev/lspsaga.nvim',
    event = "LspAttach",
    config = function ()
        require('lspsaga').setup({
            ui = {
                code_action = ""
            },
            code_action_prompt = {
                enable = false,
            },
            outline = {
                win_width = 50,
            },
            lightbulb = {
                enabled = false,
                virtual_text = false
            },
        })
    end
}
