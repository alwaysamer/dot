return {
    "krivahtoo/silicon.nvim",
    build = "./install.sh build",
    config = function ()
        require('silicon').setup({
            font = 'FiraCode Nerd Font=16',
            theme = 'OneHalfDark',
        })
    end
}
