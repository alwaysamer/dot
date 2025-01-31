return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
        bigfile = { enabled = true },
        dashboard = {
            enabled = true,
            preset = {
                keys = {
                    { icon = " ", key = "f", desc = "Find File", action = ":FzfLua files" },
                    { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
                    { icon = " ", key = "g", desc = "Find Text", action = "<cmd>lua require('fzf-lua').live_grep()<CR>" },
                    { icon = " ", key = "r", desc = "Recent Files", action = "<cmd>lua require('fzf-lua').oldfiles()<CR>" },
                    { icon = " ", key = "c", desc = "Config", action = "<cmd> lua require('fzf-lua').files({cwd = vim.fn.stdpath('config')})<CR>" },
                    { icon = "󰒲 ", key = "L", desc = "Lazy", action = ":Lazy", enabled = package.loaded.lazy ~= nil },
                    { icon = " ", key = "q", desc = "Quit", action = ":qa" },
                },
                header =
                [[
⠀⠀⠀⠀⠀⠀⢀⣴⣶⣶⣶⣶⣶⠀⠀⠀⠀⠀⢰⣶⣶⣶⣶⣦⡀⠀⠀⠀⢀⣴⣶⣶⣶⣶⣶⠀⠀⣴⣶⣶⣶⣶⣶⣶⣶⣶⣶⣶⣶⡖⠀⠀⣴⣶⣶⣶⣶⣶⣶⣶⣶⣶⣶⣶⣶⣤⠀
⠀⠀⠀⠀⠀⣴⣿⣿⣿⣿⣿⣿⣿⡄⠀⠀⠀⢀⣿⣿⣿⣿⣿⣿⣿⣦⣠⣶⣿⣿⣿⣿⣿⣿⠇⢀⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠁⢀⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇
⠀⠀⠀⢀⣀⣀⣀⣀⣀⣀⣀⣀⣀⡀⠀⠀⠀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⡀⠀⠀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⡀⠀⠀⢀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⠀
⠀⢀⣰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⢀⣿⣿⣿⣿⡏⠻⣿⣿⣿⡿⠟⣿⣿⣿⣿⣿⠇⠀⢠⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⢀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟
⠀⠚⠛⠛⠛⠛⠛⠛⠛⢿⣿⣿⣿⣿⡇⠀⣼⣿⣿⣿⣿⠁⠀⠈⠻⠋⠀⢰⣿⣿⣿⣿⡟⠀⠀⣼⣿⣿⣿⣿⡿⠟⠿⠻⠟⠿⠻⠇⠀⠀⣼⣿⣿⣿⣿⠿⠻⠟⠿⠻⣿⣿⣿⣿⡁⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⣿⢠⣿⣿⣿⣿⡏⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⠃⠀⢠⣿⣿⣿⣿⣿⣃⣀⣀⣀⣀⣀⡀⠀⠀⢠⣿⣿⣿⣿⡏⠀⠀⠀⠀⢰⣿⣿⣿⣿⠃⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣾⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⡏⠀⠀⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠇⠀⠀⣾⣿⣿⣿⣿⠁⠀⠀⠀⠀⣿⣿⣿⣿⡟⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⠛⠛⠛⠛⠛⠛⠛⠛⠃⠀⠀⠀⠀⠀⠀⠛⠛⠛⠛⠛⠁⠀⠐⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠀⠀⠐⠛⠛⠛⠛⠃⠀⠀⠀⠀⠘⠛⠛⠛⠛⠁⠀⠀⠀
                ⠀⠀⠀⠀        ]]
            },
            sections = {
                { section = "header" },
                { section = "keys",   gap = 1, padding = 1 },
                { section = "startup" },
            },
        },
        indent = {
            enabled = true,
        },
        input = { enabled = true },
        notifier = {
            enabled = true,
            timeout = 3000,
        },
        picker = { enabled = true },
        statuscolumn = { enabled = true },
    },
    keys = {
        { "<leader>.", function() Snacks.scratch() end,               desc = "Toggle Scratch Buffer" },
        { "<leader>S", function() Snacks.scratch.select() end,        desc = "Select Scratch Buffer" },
        { "<leader>n", function() Snacks.notifier.show_history() end, desc = "Notification History" },
        { "<leader>q", function() Snacks.bufdelete() end,             desc = "Delete Buffer" },
        {
            "<leader>N",
            desc = "Neovim News",
            function()
                Snacks.win({
                    file = vim.api.nvim_get_runtime_file("doc/news.txt", false)[1],
                    width = 0.6,
                    height = 0.6,
                    wo = {
                        spell = false,
                        wrap = false,
                        signcolumn = "yes",
                        statuscolumn = " ",
                        conceallevel = 3,
                    },
                })
            end,
        }
    },
    init = function()
        vim.api.nvim_set_hl(0, "SnacksIndentScope", { fg = "#ffffff" })
        vim.api.nvim_create_autocmd("User", {
            pattern = "VeryLazy",
            callback = function()
                _G.dd = function(...)
                    Snacks.debug.inspect(...)
                end
                _G.bt = function()
                    Snacks.debug.backtrace()
                end
                vim.print = _G.dd

                Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>uL")
                Snacks.toggle.diagnostics():map("<leader>ud")
                Snacks.toggle.line_number():map("<leader>ul")
                Snacks.toggle.inlay_hints():map("<leader>uh")
            end,
        })
    end,
}
