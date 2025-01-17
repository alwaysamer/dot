return {
    "OXY2DEV/markview.nvim",
    dependencies = { "echasnovski/mini.icons" },
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
