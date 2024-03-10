return {
    'ahmedkhalf/project.nvim',
    config = function()
        require("project_nvim").setup {
            manual_mode = false,
            detection_methods = { "lsp", "pattern" },
            patterns = { ".git" },
            exclude_dirs = {"~/.cargo/*", "/opt/*"},
            show_hidden = true,
            silent_chdir = true,
            scope_chdir = 'global',
            datapath = vim.fn.stdpath("data"),
        }
    end
}
