return {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "canary",
    cmd = "CopilotChat",
    keys = {
        {
            "<leader>ca",
            function()
                return require("CopilotChat").toggle()
            end,
            desc = "Toggle (CopilotChat)",
            mode = { "n", "v" },
        },
        {
            "<leader>cx",
            function()
                return require("CopilotChat").reset()
            end,
            desc = "Clear (CopilotChat)",
            mode = { "n", "v" },
        },
        {
            "<leader>cq",
            function()
                local input = vim.fn.input("Quick Chat: ")
                if input ~= "" then
                    require("CopilotChat").ask(input)
                end
            end,
            desc = "Quick Chat (CopilotChat)",
            mode = { "n", "v" },
        },
        {
            "<leader>cd",
            ":CopilotChatFixDiagnostic<cr>",
            desc = "Commit (CopilotChat)",
            mode = { "n", "v" },
        },
    },
    config = function()
        require("CopilotChat").setup {
            model = 'gpt-4',
            question_header = '## Amer ',
            answer_header = '## Copilot ',
            error_header = '## Error ',
            separator = '───',
            show_folds = false,
            show_help = false,
            auto_follow_cursor = true,
            auto_insert_mode = false,
            clear_chat_on_new_prompt = false,
            highlight_selection = true,
            context = 'buffers',
            history_path = vim.fn.stdpath('data') .. '/copilotchat_history',

            window = {
                layout = 'float',
                width = 0.5,
                height = 0.5,
                relative = 'editor',
                border = 'single',
                title = 'Copilot Chat',
                footer = nil,
                zindex = 1,
            },
        }
    end
}
