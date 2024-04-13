return {
    'goolord/alpha-nvim',
    config = function()
        local alpha = require("alpha")
        local dashboard = require("alpha.themes.dashboard")

        dashboard.section.header.val = {
            "  █████╗ ███╗   ███╗███████╗██████╗ ",
            " ██╔══██╗████╗ ████║██╔════╝██╔══██╗",
            " ███████║██╔████╔██║█████╗  ██████╔╝",
            " ██╔══██║██║╚██╔╝██║██╔══╝  ██╔══██╗",
            " ██║  ██║██║ ╚═╝ ██║███████╗██║  ██║",
            " ╚═╝  ╚═╝╚═╝     ╚═╝╚══════╝╚═╝  ╚═╝",
        }

        dashboard.section.buttons.val = {
            dashboard.button("n", "  > New file", ":silent ene <BAR> startinsert <CR>"),
            dashboard.button("r", "  > Recent", ":silent Telescope oldfiles<CR>"),
            dashboard.button("p", "  > Projects", ":silent Telescope projects<CR>"),
            dashboard.button("s", "  > Settings", ":silent e $MYVIMRC<CR>"),
            dashboard.button("q", "󰩈  > Quit NVIM", ":silent qa<CR>"),
        }

        alpha.setup(dashboard.opts)

        vim.api.nvim_create_autocmd("User", {
            callback = function()
                local stats = require("lazy").stats()
                local ms = math.floor(stats.startuptime * 100) / 100
                dashboard.section.footer.val = "󱐌 Lazy-loaded "
                    .. stats.loaded
                    .. "/"
                    .. stats.count
                    .. " plugins in "
                    .. ms
                    .. "ms"
                pcall(vim.cmd.AlphaRedraw)
            end,
        })

        vim.cmd([[
            autocmd FileType alpha setlocal nofoldenable
        ]])
    end,
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    }
}
