return {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
        require('copilot').setup({
            panel = { enabled = false },
            suggestion = {
                enabled = true,
                auto_trigger = false,
                debounce = 75,
                keymap = {
                    accept = "<C-j>",
                    accept_word = false,
                    accept_line = false,
                    next = "<c-s>",
                    prev = nil,
                    dismiss = "<C-o>",
                },
            },
            filetypes = {
                yaml = true,
                markdown = true,
                help = true,
                gitcommit = true,
                gitrebase = true,
                hgcommit = true,
                svn = true,
                cvs = true,
                ["."] = true,
            },
            copilot_node_command = 'node',
            server_opts_overrides = {},
        })
    end,
}
