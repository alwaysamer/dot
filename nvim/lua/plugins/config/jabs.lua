return {
    "matbme/JABS.nvim",
    config = function ()
        require 'jabs'.setup {
            clip_popup_size = false,
            border = 'rounded',
            offset = {
                top = 2,
                bottom = 2,
                left = 2,
                right = 2,
            },
            sort_mru = true,
            split_filename = true,
            split_filename_path_width = 20,
            preview_position = 'left',
            preview = {
                width = 70,
                height = 30,
                border = 'rounded',
            },

            symbols = {
                current = "C",
                split = "S",
                alternate = "A",
                hidden = "H",
                locked = "L",
                ro = "R",
                edited = "E",
                terminal = "T",
                default_file = "D",
                terminal_symbol = ">_"
            },
            keymap = {
                h_split = "h",
                v_split = "v",
                preview = "p",
            },
            use_devicons = true
        }
    end
}
