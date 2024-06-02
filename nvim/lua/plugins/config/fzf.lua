return {
    "ibhagwan/fzf-lua",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        require('fzf-lua').setup({ 'fzf-native' })
        require('fzf-lua').register_ui_select()

        vim.keymap.set("n", "<c-f>", "<cmd>lua require('fzf-lua').files()<CR>", { silent = true })
        vim.keymap.set("n", "<leader>ps", "<cmd>lua require('fzf-lua').live_grep()<CR>", { silent = true })
        vim.keymap.set("n", "<c-b>", "<cmd>lua require('fzf-lua').buffers()<CR>", { silent = true })
        vim.keymap.set("n", "<leader>fh", "<cmd>lua require('fzf-lua').helptags()<CR>", { silent = true })
        vim.keymap.set("n", "<leader>fg", "<cmd>lua require('fzf-lua').git_files()<CR>", { silent = true })
        vim.keymap.set("n", "<leader>fd", "<cmd>lua require('fzf-lua').lsp_workspace_diagnostics()<CR>",
            { silent = true })
        vim.keymap.set({ "i" }, "<C-x><C-f>",
            function()
                require("fzf-lua").complete_file({
                    cmd = "rg --files",
                    winopts = { preview = { hidden = "nohidden" } }
                })
            end, { silent = true, desc = "Fuzzy complete file" })
    end
}
