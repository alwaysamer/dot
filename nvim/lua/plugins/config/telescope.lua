return {
    'nvim-telescope/telescope.nvim',
    version = '0.1.5',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'ahmedkhalf/project.nvim',
    },
    config = function()
        require("project_nvim").setup {
            manual_mode = false,
            detection_methods = { "lsp", "pattern" },
            patterns = { ".git" },
            exclude_dirs = { "~/.cargo/*", "/opt/*" },
            show_hidden = true,
            silent_chdir = true,
            scope_chdir = 'global',
            datapath = vim.fn.stdpath("data"),
        }

        require('telescope').load_extension('projects')

        vim.keymap.set("n", "<leader>ff", require("telescope.builtin").find_files, { silent = true })
        vim.keymap.set("n", "<leader>ps",
            function() require("telescope.builtin").grep_string({ search = vim.fn.input("Grep > ") }); end,
            { silent = true })
        vim.keymap.set("n", "<leader>fb", function()
            require("telescope.builtin").buffers({
                show_all_buffers = true,
                sort_lastused = true,
                ignore_current_buffer = true,
            })
        end, { silent = true })
        vim.keymap.set("n", "<leader>fh", function() require("telescope.builtin").help_tags({ show_version = true }) end,
            { silent = true })
        vim.keymap.set("n", "<leader>fg", function() require("telescope.builtin").git_files() end, { silent = true })
        vim.keymap.set("n", "<leader>fd", function() require("telescope.builtin").diagnostics() end, { silent = true })
    end
}
