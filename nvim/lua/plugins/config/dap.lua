return {
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            "rcarriga/nvim-dap-ui",
            "leoluz/nvim-dap-go",
            "nvim-neotest/nvim-nio",
            "mfussenegger/nvim-dap-python",
            'theHamsta/nvim-dap-virtual-text',
        },
        config = function()
            local dap = require "dap"
            local ui = require "dapui"

            require("dapui").setup()
            require("dap-python").setup('~/.virtualenvs/debugpy/bin/python')
            require("dap-go").setup({
                dap_configurations = {
                    {
                        type = "go",
                        request = "launch",
                        name = "Launch Project",
                        program = vim.loop.cwd() .. "/main.go",
                    },
                }
            })
            require("nvim-dap-virtual-text").setup()

            dap.adapters.codelldb = {
                type = 'server',
                port = "${port}",
                executable = {
                    command = 'codelldb',
                    args = { "--port", "${port}" },
                }
            }
            dap.configurations.rust = {
                {
                    name = "Debug",
                    type = "codelldb",
                    request = "launch",
                    program = function()
                        return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                    end,
                    cwd = "${workspaceFolder}",
                    stopOnEntry = false,
                },
            }
            dap.configurations.python = {
                {
                    type = 'python',
                    request = 'launch',
                    name = "Launch file",
                    program = "${file}",
                },
                {
                    type = 'python',
                    request = 'launch',
                    name = 'DAP Django',
                    program = vim.loop.cwd() .. '/manage.py',
                    args = { 'runserver', '--noreload' },
                    justMyCode = true,
                    django = true,
                    console = "integratedTerminal",
                },
                {
                    type = 'python',
                    request = 'attach',
                    name = 'Attach remote',
                    connect = function()
                        return {
                            host = '127.0.0.1',
                            port = 5678
                        }
                    end,
                },
                {
                    type = 'python',
                    request = 'launch',
                    name = 'Launch file with arguments',
                    program = '${file}',
                    args = function()
                        local args_string = vim.fn.input('Arguments: ')
                        return vim.split(args_string, " +")
                    end,
                    console = "integratedTerminal",
                }
            }



            vim.keymap.set("n", "<space>b", dap.toggle_breakpoint, { desc = "DAP Toggle Breakpoint" })
            vim.keymap.set("n", "<space>gb", dap.run_to_cursor, { desc = "DAP Run to Cursor" })

            vim.keymap.set("n", "<F1>", dap.continue, { desc = "DAP Continue" })
            vim.keymap.set("n", "<F2>", dap.step_into, { desc = "DAP Step Into" })
            vim.keymap.set("n", "<F3>", dap.step_over, { desc = "DAP Step Over" })
            vim.keymap.set("n", "<F4>", dap.step_out, { desc = "DAP Step Out" })
            vim.keymap.set("n", "<F5>", dap.step_back, { desc = "DAP Step Back" })
            vim.keymap.set("n", "<F13>", dap.restart, { desc = "DAP Restart" })

            dap.listeners.before.attach.dapui_config = function()
                ui.open()
            end
            dap.listeners.before.launch.dapui_config = function()
                ui.open()
            end
            dap.listeners.before.event_terminated.dapui_config = function()
                ui.close()
            end
            dap.listeners.before.event_exited.dapui_config = function()
                ui.close()
            end
        end,
    },
}
