return {
    'otavioschwanck/arrow.nvim',
    config = function ()
        require("notify").setup(
        {
            fps = 60,
            icons = {
                DEBUG = "",
                ERROR = "",
                INFO = "",
                TRACE = "✎",
                WARN = ""
            },
            level = 6,
            minimum_width = 30,
            render = "compact",
            stages = "fade_in_slide_out",
            time_formats = {
                notification = "%T",
                notification_history = "%FT%T"
            },
            timeout = 3000,
            top_down = true
        })
    end
}