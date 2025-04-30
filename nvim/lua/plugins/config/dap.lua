return {
    "mfussenegger/nvim-dap",
    dependencies = {
        {
            "rcarriga/nvim-dap-ui"
        }
    },
    config = function()
        local dap, dapui = require("dap"), require("dapui")
        dapui.setup()
        dap.listeners.before.attach.dapui_config = function()
            dapui.open()
        end
        dap.listeners.before.launch.dapui_config = function()
            dapui.open()
        end
        dap.listeners.before.event_terminated.dapui_config = function()
            dapui.close()
        end
        dap.listeners.before.event_exited.dapui_config = function()
            dapui.close()
        end
        vim.keymap.set("n", "<leader>db", function()
            require("dap").toggle_breakpoint()
        end, { desc = "Toggle Breakpoint" })
        vim.keymap.set("n", "<leader>dr", function()
            require("dap").continue()
        end, { desc = "Start/Resume Debugging" })
        vim.keymap.set("n", "<leader>do", function()
            require("dap").step_over()
        end, { desc = "Debug Step over" })
        vim.keymap.set("n", "<leader>di", function()
            require("dap").step_into()
        end, { desc = "Debug Step into" })
        vim.keymap.set("n", "<leader>ds", function()
            require("dap").terminate()
        end, { desc = "Stop debugging" })
    end
}
