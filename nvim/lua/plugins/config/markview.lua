return {
    "OXY2DEV/markview.nvim",
    dependencies = { "echasnovski/mini.icons" },
    ft = "markdown",
    config = function()
        require("markview").setup();
    end
}
