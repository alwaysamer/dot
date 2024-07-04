return {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    dependencies = {
        {
            "zbirenbaum/copilot-cmp",
        },
        {
            "CopilotC-Nvim/CopilotChat.nvim",
            branch = "canary",
            dependencies = {
                { "nvim-lua/plenary.nvim" },
            },
        },
    },
    event = "InsertEnter",
    config = function()
        require('copilot').setup({
            panel = { enabled = false },
            suggestion = { enabled = false },
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
        require("copilot_cmp").setup()
    end,
}
