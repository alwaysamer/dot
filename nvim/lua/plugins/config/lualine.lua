return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        require('lualine').setup {
            options = {
                icons_enabled = true,
                theme = 'horizon',
                section_separators = { left = '', right = '' },
                component_separators = '',
                disabled_filetypes = { 'alpha' },
                ignore_focus = {},
                always_divide_middle = true,
                globalstatus = false,
                refresh = {
                    statusline = 1000,
                    tabline = 1000,
                    winbar = 1000,
                }
            },
            sections = {
                lualine_a = { 'mode' },
                lualine_c = { 'filename' },
                lualine_x = {
                    "encoding",
                    "fileformat",
                    "filetype",
                },
                lualine_y = { 'progress' },
                lualine_z = { 'location' }
            },
            inactive_sections = {
                lualine_a = { 'filename' },
                lualine_b = {},
                lualine_c = {},
                lualine_x = {},
                lualine_y = {},
                lualine_z = { 'location' }
            },
            tabline = {},
            winbar = {},
            inactive_winbar = {},
            extensions = { 'oil', 'lazy', 'quickfix'}
        }
    end
}
