return {
    "OXY2DEV/markview.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },

    config = function()
        require("markview").setup();
    end
}
