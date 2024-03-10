return {
    'otavioschwanck/arrow.nvim',
    config = function()
        require("arrow").setup({
            show_icon = true,
            leader = ";",
        })
    end

}
