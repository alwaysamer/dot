return {
    "OXY2DEV/markview.nvim",
    dependencies = {
        "echasnovski/mini.icons",
        {
            "OXY2DEV/helpview.nvim",
            lazy = false,
            dependencies = {
                "nvim-treesitter/nvim-treesitter"
            }
        }
    },
    ft = "markdown",
    config = function()
        require("markview").setup({
            links = {
                enable = true,
                internal_links = {
                    enable = true,
                }
            }
        });
    end
}
