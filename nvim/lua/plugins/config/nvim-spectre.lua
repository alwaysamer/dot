return {
    "nvim-pack/nvim-spectre",
    cmd = "Spectre",
    keys = {
        {
            "<leader>s",
            function()
                require("spectre").toggle()
            end,
            desc = "Spectre Close",
        },
    },
}
