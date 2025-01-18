return {
    'goolord/alpha-nvim',
    config = function()
        local alpha = require("alpha")
        local dashboard = require("alpha.themes.dashboard")

        local amer =
        [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
                ⠀⠀⠀⠀⠀⠀⢀⣴⣶⣶⣶⣶⣶⠀⠀⠀⠀⠀⢰⣶⣶⣶⣶⣦⡀⠀⠀⠀⢀⣴⣶⣶⣶⣶⣶⠀⠀⣴⣶⣶⣶⣶⣶⣶⣶⣶⣶⣶⣶⡖⠀⠀⣴⣶⣶⣶⣶⣶⣶⣶⣶⣶⣶⣶⣶⣤⠀⠀
                ⠀⠀⠀⠀⠀⣴⣿⣿⣿⣿⣿⣿⣿⡄⠀⠀⠀⢀⣿⣿⣿⣿⣿⣿⣿⣦⣠⣶⣿⣿⣿⣿⣿⣿⠇⢀⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠁⢀⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇
                ⠀⠀⠀⢀⣀⣀⣀⣀⣀⣀⣀⣀⣀⡀⠀⠀⠀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⡀⠀⠀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⡀⠀⠀⢀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⠀
                ⠀⢀⣰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⢀⣿⣿⣿⣿⡏⠻⣿⣿⣿⡿⠟⣿⣿⣿⣿⣿⠇⠀⢠⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⢀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟
                ⠀⠚⠛⠛⠛⠛⠛⠛⠛⢿⣿⣿⣿⣿⡇⠀⣼⣿⣿⣿⣿⠁⠀⠈⠻⠋⠀⢰⣿⣿⣿⣿⡟⠀⠀⣼⣿⣿⣿⣿⡿⠟⠿⠻⠟⠿⠻⠇⠀⠀⣼⣿⣿⣿⣿⠿⠻⠟⠿⠻⣿⣿⣿⣿⡁⠀⠀
                ⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⣿⢠⣿⣿⣿⣿⡏⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⠃⠀⢠⣿⣿⣿⣿⣿⣃⣀⣀⣀⣀⣀⡀⠀⠀⢠⣿⣿⣿⣿⡏⠀⠀⠀⠀⢰⣿⣿⣿⣿⠃⠀⠀⠀
                ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣾⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⡏⠀⠀⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠇⠀⠀⣾⣿⣿⣿⣿⠁⠀⠀⠀⠀⣿⣿⣿⣿⡟⠀⠀⠀
                ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⠛⠛⠛⠛⠛⠛⠛⠛⠃⠀⠀⠀⠀⠀⠀⠛⠛⠛⠛⠛⠁⠀⠐⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠀⠀⠐⠛⠛⠛⠛⠃⠀⠀⠀⠀⠘⠛⠛⠛⠛⠁⠀⠀⠀
    ⠀⠀⠀⠀]]

        dashboard.section.header.val = vim.split(amer, "\n")
        dashboard.section.buttons.val = {
            dashboard.button("n", "  > New file", ":silent ene <BAR> startinsert <CR>"),
            dashboard.button("f", "󰈞  > Find file", ":FzfLua files<CR>"),
            dashboard.button("r", "  > Recent files", "<cmd>lua require('fzf-lua').oldfiles()<CR>"),
            dashboard.button("u", "󰶼  > Update Plugins", ":Lazy update<CR>"),
            dashboard.button("q", "󰩈  > Quit NVIM", ":silent qa<CR>"),
        }

        alpha.setup(dashboard.opts)

        vim.api.nvim_create_autocmd("User", {
            callback = function()
                local stats = require("lazy").stats()
                local ms = math.floor(stats.startuptime * 100) / 100
                dashboard.section.footer.val = "󱐌 Lazy loaded "
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
}
