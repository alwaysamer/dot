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
    dashboard.button( "d", "  > Docs", ":ObsidianWorkspace<CR>"),
    dashboard.button( "s", "  > Settings" , ":e $MYVIMRC<CR>"),
    dashboard.button( "q", "󰩈  > Quit NVIM", ":qa<CR>"),
}

dashboard.section.footer.val = "Imperare Sibi Maximum Imperium Est"
dashboard.section.footer.opts.hl = "Constant"

alpha.setup(dashboard.opts)

vim.cmd([[
    autocmd FileType alpha setlocal nofoldenable
]])
