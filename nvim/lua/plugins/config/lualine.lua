return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        require('lualine').setup {
            options = {
                icons_enabled = true,
                theme = 'horizon',
                component_separators = '',
                section_separators = { left = '', right = '' },
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
                lualine_a = { { 'mode', separator = { left = '', right = '' }, right_padding = 2 } },
                lualine_c = { 'filename' },
                lualine_x = {
                    "encoding",
                    "fileformat",
                    "filetype",
                },
                lualine_y = { 'progress' },
                lualine_z = {
                    { 'location', separator = { right = '', left = '' }, left_padding = 2 },
                },
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
            extensions = { 'oil', 'lazy', 'quickfix' }
        }
    end
}
