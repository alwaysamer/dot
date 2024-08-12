return {
    'akinsho/bufferline.nvim',
    version = "*",
    config = function()
        local bufferline = require('bufferline')
        bufferline.setup({
            options = {
                mode = "buffers",
                style_preset = bufferline.style_preset.no_italic,
                themable = true,
                buffer_close_icon = nil,
                modified_icon = '●',
                close_icon = nil,
                separator_style = { "", "" },
                indicator = {
                    style = 'underline'
                },
                max_prefix_length = 15,
                truncate_names = true,
                tab_size = 18,
                diagnostics = "nvim_lsp",
                diagnostics_update_in_insert = false,
                diagnostics_update_on_event = true,
                color_icons = true,
                show_buffer_icons = true,
                show_buffer_close_icons = false,
                show_close_icon = false,
                hover = {
                    enabled = false,
                },
            }
        })
    end
}
