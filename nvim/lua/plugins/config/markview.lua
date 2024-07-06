return {
    "OXY2DEV/markview.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    event = "BufRead *.md",
    config = function()
        require("markview").setup();
    end
}
