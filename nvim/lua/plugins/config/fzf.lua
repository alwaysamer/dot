return {
    "ibhagwan/fzf-lua",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        local fzf = require('fzf-lua')
        fzf.setup({
            winopts = {
                border = "single",
                preview = {
                    title = false,
                    scrollbar = false,
                }
            },
            hls = {
                border = "FloatBorder",
                normal = "NONE",
                preview_normal = "NONE",
                preview_border = "FloatBorder",
            }
        })
        fzf.register_ui_select()

        vim.keymap.set("n", "<c-f>", "<cmd>lua require('fzf-lua').files()<CR>",
            { silent = true, desc = "Fuzzy Files" })
        vim.keymap.set("n", "<leader>ps", "<cmd>lua require('fzf-lua').live_grep()<CR>",
            { silent = true, desc = "Fuzzy Grep" })
        vim.keymap.set("n", "<c-b>", "<cmd>lua require('fzf-lua').buffers()<CR>",
            { silent = true, desc = "Fuzzy Buffers" })
        vim.keymap.set("n", "<leader>fh", "<cmd>lua require('fzf-lua').helptags()<CR>",
            { silent = true, desc = "Fuzzy Helptags" })
        vim.keymap.set("n", "<leader>km", "<cmd>lua require('fzf-lua').keymaps({ previewer=false })<CR>",
            { silent = true, desc = "Fuzzy Keymaps" })
        vim.keymap.set("n", "gc", function()
                require('fzf-lua').lsp_code_actions({
                    winopts = {
                        split = "belowright new",
                        preview = {
                            layout = "horizontal",
                        }
                    },
                })
            end,
            { silent = true, desc = "Fuzzy Show Code Actions" })
        vim.keymap.set("n", "gr", function()
                require('fzf-lua').lsp_references({
                    winopts = {
                        split = "belowright new",
                        preview = {
                            layout = "horizontal",
                        }
                    },
                })
            end,
            { silent = true, desc = "Fuzzy Show LSP References" })
        vim.keymap.set("n", "gD", function()
                require('fzf-lua').lsp_definitions({
                    winopts = {
                        split = "belowright new",
                        preview = {
                            layout = "horizontal",
                        }
                    },
                })
            end,
            { silent = true, desc = "Fuzzy Show LSP Definitions" })
        vim.keymap.set("n", "gi", function()
                require('fzf-lua').lsp_implementations({
                    winopts = {
                        split = "belowright new",
                        preview = {
                            layout = "horizontal",
                        }
                    },
                })
            end,
            { silent = true, desc = "Fuzzy Show LSP Implementations" })
        vim.keymap.set("n", "xx", function()
                require('fzf-lua').lsp_document_diagnostics({
                    winopts = {
                        split = "belowright new",
                        preview = {
                            layout = "horizontal",
                        }
                    },
                })
            end,
            { silent = true, desc = "Fuzzy Show LSP Document Diagnostics" })
        vim.keymap.set("n", "xx", function()
                require('fzf-lua').lsp_workspace_diagnostics({
                    winopts = {
                        split = "belowright new",
                        preview = {
                            layout = "horizontal",
                        }
                    },
                })
            end,
            { silent = true, desc = "Fuzzy Show LSP Workspace Diagnostics" })
        vim.keymap.set({ "i" }, "<C-x><C-f>",
            function()
                require("fzf-lua").complete_file({
                    cmd = "rg --files",
                    winopts = { preview = { hidden = "nohidden" } }
                })
            end, { silent = true, desc = "Fuzzy complete file" })
    end
}
