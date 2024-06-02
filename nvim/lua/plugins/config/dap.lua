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

            dap.configurations.scala = {
                {

                    type = "scala",
                    request = "launch",
                    name = "Run",
                    metals = {
                        runType = "runOrTestFile",
                    },
                },
            }


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



            vim.keymap.set("n", "<space>b", dap.toggle_breakpoint)
            vim.keymap.set("n", "<space>gb", dap.run_to_cursor)

            vim.keymap.set("n", "<F1>", dap.continue)
            vim.keymap.set("n", "<F2>", dap.step_into)
            vim.keymap.set("n", "<F3>", dap.step_over)
            vim.keymap.set("n", "<F4>", dap.step_out)
            vim.keymap.set("n", "<F5>", dap.step_back)
            vim.keymap.set("n", "<F13>", dap.restart)

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
