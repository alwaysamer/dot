return {
    'fei6409/log-highlight.nvim',
    event = "BufRead *.log",
    config = function()
        require('log-highlight').setup {}
    end,
}
