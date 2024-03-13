return {
    'goolord/alpha-nvim',
    config = function ()
        local alpha = require("alpha")
        local dashboard = require("alpha.themes.dashboard")
        dashboard.section.header.val = {
           " ██████╗ ███████╗ ██████╗     ██╗   ██╗ ██████╗ ██╗     ███████╗███╗   ██╗████████╗███████╗ ",
           " ██╔══██╗██╔════╝██╔═══██╗    ██║   ██║██╔═══██╗██║     ██╔════╝████╗  ██║╚══██╔══╝██╔════╝ ",
           " ██║  ██║█████╗  ██║   ██║    ██║   ██║██║   ██║██║     █████╗  ██╔██╗ ██║   ██║   █████╗   ",
           " ██║  ██║██╔══╝  ██║   ██║    ╚██╗ ██╔╝██║   ██║██║     ██╔══╝  ██║╚██╗██║   ██║   ██╔══╝   ",
           " ██████╔╝███████╗╚██████╔╝     ╚████╔╝ ╚██████╔╝███████╗███████╗██║ ╚████║   ██║   ███████╗ ",
           " ╚═════╝ ╚══════╝ ╚═════╝       ╚═══╝   ╚═════╝ ╚══════╝╚══════╝╚═╝  ╚═══╝   ╚═╝   ╚══════╝ ",
        }
        dashboard.section.buttons.val = {
            dashboard.button( "e", "  > New file" , ":ene <BAR> startinsert <CR>"),
            dashboard.button( "f", "  > Recent", ":Telescope oldfiles<CR>"),
            dashboard.button( "r", "  > Projects"   , ":Telescope projects<CR>"),
            dashboard.button( "d", "  > Docs", ":Neorg index<CR>"),
            dashboard.button( "s", "  > Settings" , ":e $MYVIMRC<CR>"),
            dashboard.button( "q", "󰩈  > Quit NVIM", ":qa<CR>"),
        }

        alpha.setup(dashboard.opts)

        vim.cmd([[
            autocmd FileType alpha setlocal nofoldenable
        ]])
    end,
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    }
}
