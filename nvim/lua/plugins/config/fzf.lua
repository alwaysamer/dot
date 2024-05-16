return {
    "ibhagwan/fzf-lua",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
        "alwaysamer/fzf-lua-projections.nvim",
        {
            "gnikdroy/projections.nvim",
            branch = "pre_release",
        },
    },
    config = function()
        require("projections").setup({
            workspaces = {
                "~/source",
                "~/",
            },
            patterns = {".git"},
            workspaces_file = "~/.nvim.workspaces",
            sessions_directory = "~/.nvim.sessions",
        })
        require('fzf-lua').register_ui_select()

        vim.keymap.set("n", "<leader>ff", "<cmd>lua require('fzf-lua').files()<CR>", { silent = true })
        vim.keymap.set("n", "<leader>ps", "<cmd>lua require('fzf-lua').live_grep()<CR>", { silent = true })
        vim.keymap.set("n", "<leader>fb", "<cmd>lua require('fzf-lua').buffers()<CR>", { silent = true })
        vim.keymap.set("n", "<leader>fh", "<cmd>lua require('fzf-lua').helptags()<CR>", { silent = true })
        vim.keymap.set("n", "<leader>fg", "<cmd>lua require('fzf-lua').git_files()<CR>", { silent = true })
        vim.keymap.set("n", "<leader>fd", "<cmd>lua require('fzf-lua').lsp_workspace_diagnostics()<CR>", { silent = true })
        vim.keymap.set("n", "<leader>fp", "<cmd>lua require('fzf-lua-p').projects()<CR>", { silent = true })
    end
}
