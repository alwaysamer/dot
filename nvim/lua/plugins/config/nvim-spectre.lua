return {
    "nvim-pack/nvim-spectre",
    cmd = "Spectre",
    keys = {
        {
            "<leader>sf",
            function()
                require("spectre").open_file_search({ select_word = true })
            end,
            desc = "Spectre Search in File",
        },
        {
            "<leader>s",
            function()
                require("spectre").open_visual({ select_word = true })
            end,
            desc = "Spectre Search in File",
        },

        {
            "<leader>S",
            function()
                require("spectre").toggle()
            end,
            desc = "Spectre Close",
        },
    },
}
