return {
    'nvimdev/indentmini.nvim',
    event = 'BufEnter',
    config = function()
        require('indentmini').setup()
        -- 383d4d
        vim.cmd.highlight('IndentLine guifg=#3c4253')
    end,
}
