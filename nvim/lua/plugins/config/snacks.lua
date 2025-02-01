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
        local progress = vim.defaulttable()
        vim.api.nvim_create_autocmd("LspProgress", {
            callback = function(ev)
                local client = vim.lsp.get_client_by_id(ev.data.client_id)
                local value = ev.data.params
                .value
                if not client or type(value) ~= "table" then
                    return
                end
                local p = progress[client.id]

                for i = 1, #p + 1 do
                    if i == #p + 1 or p[i].token == ev.data.params.token then
                        p[i] = {
                            token = ev.data.params.token,
                            msg = ("[%3d%%] %s%s"):format(
                                value.kind == "end" and 100 or value.percentage or 100,
                                value.title or "",
                                value.message and (" **%s**"):format(value.message) or ""
                            ),
                            done = value.kind == "end",
                        }
                        break
                    end
                end

                local msg = {}
                progress[client.id] = vim.tbl_filter(function(v)
                    return table.insert(msg, v.msg) or not v.done
                end, p)

                local spinner = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }
                vim.notify(table.concat(msg, "\n"), "info", {
                    id = "lsp_progress",
                    title = client.name,
                    opts = function(notif)
                        notif.icon = #progress[client.id] == 0 and " "
                            or spinner[math.floor(vim.uv.hrtime() / (1e6 * 80)) % #spinner + 1]
                    end,
                })
            end,
        })
    end,
}
