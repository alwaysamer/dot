return {
    "OXY2DEV/markview.nvim",
        "nvim-tree/nvim-web-devicons",
    },
    ft = "markdown",
    config = function()
        require("markview").setup();
    end
}
