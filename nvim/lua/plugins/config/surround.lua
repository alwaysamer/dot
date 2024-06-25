return {
    'echasnovski/mini.surround',
    version = '*',
    config = function()
        require('mini.surround').setup(
            {
                mappings = {
                    add = '<c-s>',
                    delete = 'sd',
                    find = '',
                    find_left = '',
                    highlight = '',
                    replace = 'sr',
                    update_n_lines = '',
                    suffix_last = '',
                    suffix_next = '',
                },
            }
        )
    end,
}
