return {
    'goolord/alpha-nvim',
    config = function()
        local alpha = require("alpha")
        local dashboard = require("alpha.themes.dashboard")
        dashboard.section.header.val = {
            "           ▄ ▄                   ",
            "       ▄   ▄▄▄     ▄ ▄▄▄ ▄ ▄     ",
            "       █ ▄ █▄█ ▄▄▄ █ █▄█ █ █     ",
            "    ▄▄ █▄█▄▄▄█ █▄█▄█▄▄█▄▄█ █     ",
            "  ▄ █▄▄█ ▄ ▄▄ ▄█ ▄▄▄▄▄▄▄▄▄▄▄▄▄▄  ",
            "  █▄▄▄▄ ▄▄▄ █ ▄ ▄▄▄ ▄ ▄▄▄ ▄ ▄ █ ▄",
            "▄ █ █▄█ █▄█ █ █ █▄█ █ █▄█ ▄▄▄ █ █",
            "█▄█ ▄ █▄▄█▄▄█ █ ▄▄█ █ ▄ █ █▄█▄█ █",
            "    █▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄█ █▄█▄▄▄█    ",
        }

        dashboard.section.buttons.val = {
            dashboard.button("n", "  > New file", ":silent ene <BAR> startinsert <CR>"),
            dashboard.button("r", "  > Recent files"   , "<cmd>lua require('fzf-lua').oldfiles()<CR>"),
            dashboard.button("q", "󰩈  > Quit NVIM", ":silent qa<CR>"),
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
