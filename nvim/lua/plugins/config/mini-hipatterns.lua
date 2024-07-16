return {
    'echasnovski/mini.hipatterns',
    version = '*',
    event = "BufRead",
    config = function()
        local hipatterns = require('mini.hipatterns')
        hipatterns.setup({
            highlighters = {
                fixme     = { pattern = '%f[%w]()FIXME()%f[%W]', group = 'MiniHipatternsFixme' },
                hack      = { pattern = '%f[%w]()HACK()%f[%W]', group = 'MiniHipatternsHack' },
                todo      = { pattern = '%f[%w]()TODO()%f[%W]', group = 'MiniHipatternsTodo' },
                hex_color = hipatterns.gen_highlighter.hex_color(),
            },
        })
    end
}
