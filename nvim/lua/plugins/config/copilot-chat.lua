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
            desc = "CopilotChat Toggle",
            mode = { "n", "v" },
        },
        {
            "<leader>cq",
            function()
                vim.ui.input({ "Quick Chat: " }, function(input)
                    if input ~= "" then
                        require("CopilotChat").ask(input)
                    end
                end)
            end,
            desc = "CopilotChat Quick Chat",
            mode = { "n", "v" },
        },
        {
            "<leader>cd",
            ":CopilotChatFixDiagnostic<cr>",
            desc = "Copilot FixDiagnostic",
            mode = { "n", "v" },
        },
    },
    config = function()
        require("CopilotChat").setup {
            model = 'gpt-4',
            question_header = '## Me ',
            answer_header = '## Copilot ',
            error_header = '## Error ',
            separator = '───',
            show_folds = false,
            show_help = false,
            auto_follow_cursor = true,
            auto_insert_mode = false,
            clear_chat_on_new_prompt = true,
            highlight_selection = false,
            context = 'buffers',
            history_path = vim.fn.stdpath('data') .. '/copilotchat_history',

            window = {
                layout = 'float',
                width = 0.85,
                height = 0.85,
                relative = 'editor',
                border = 'single',
                title = 'Copilot Chat',
                footer = nil,
                zindex = 1,
            },
        }
    end
}
