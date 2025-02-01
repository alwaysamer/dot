return {
    "CopilotC-Nvim/CopilotChat.nvim",
    build = "make tiktoken",
    branch = "main",
    dependencies = {
        { "github/copilot.vim" },
        { "nvim-lua/plenary.nvim", branch = "master" },
    },
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
                    if input ~= "" and input ~= nil then
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
            model = 'gpt-4o',
            agent = 'copilot',
            context = "buffers",
            temperature = 0.1,
            headless = false,
            callback = nil,
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
            show_help = false,
            show_folds = false,
            highlight_selection = false,
            highlight_headers = true,
            auto_follow_cursor = true,
            auto_insert_mode = false,
            insert_at_end = false,
            clear_chat_on_new_prompt = false,
            debug = false,
            log_level = 'info',
            proxy = nil,
            allow_insecure = false,
            chat_autocomplete = false,
            history_path = vim.fn.stdpath('data') .. '/copilotchat_history',
            question_header = '## Me ',
            answer_header = '## Copilot ',
            error_header = '## Error ',
            separator = '───',
            mappings = {
                complete = {
                    insert = ''
                },
            },
        }
    end
}
