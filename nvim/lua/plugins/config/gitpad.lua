return {
    'yujinyuz/gitpad.nvim',
    config = function()
        require('gitpad').setup({
            title = 'Notes',
            border = 'single',
            style = 'minimal',
            dir = '~/notes',
            default_text = '',
            on_attach = function(bufnr)
                vim.api.nvim_buf_set_keymap(bufnr, 'n', 'q', '<Cmd>wq<CR>', { noremap = true, silent = true })
            end,
        })
    end,
    keys = {
        {
            '<leader>pp',
            function()
                require('gitpad').toggle_gitpad()
            end,
            desc = 'gitpad project',
        },
        {
            '<leader>pb',
            function()
                require('gitpad').toggle_gitpad_branch()
            end,
            desc = 'gitpad branch',
        },
        {
            '<leader>pd',
            function()
                local date_filename = 'daily-' .. os.date('%Y-%m-%d.md')
                require('gitpad').toggle_gitpad({ filename = date_filename })
            end,
            desc = 'gitpad daily notes',
        },
        {
            '<leader>pf',
            function()
                local filename = vim.fn.expand('%:p')
                if filename == '' then
                    vim.notify('empty bufname')
                    return
                end
                filename = vim.fn.pathshorten(filename, 2) .. '.md'
                require('gitpad').toggle_gitpad({ filename = filename })
            end,
            desc = 'gitpad per file notes',
        },
    },
}
