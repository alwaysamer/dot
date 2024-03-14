return {
    'mrjones2014/legendary.nvim',
    config = function()
        require('legendary').setup({
            keymaps = {
                { '<leader>ll', ":Legendary<CR>",                                                                               description = "Show Keymaps" },
                { '<leader>ff', require("telescope.builtin").find_files,                                                        description = "Telescope Find Files" },
                { '<leader>fb', require("telescope.builtin").buffers,                                                           description = "Telescope Find Buffers" },
                { '<leader>ps', function() require("telescope.builtin").grep_string({ search = vim.fn.input("Grep > ") }); end, description = "Grep String" },
                { '<leader>pv', ":NvimTreeToggle<CR>",                                                                          description = "Toggle Project-View" },
                { '<C-i>',      ":BufferPrevious<CR>",                                                                          description = "Previous Tab" },
                { '<C-o>',      ":BufferNext<CR>",                                                                              description = "Next Tab" },
                { '<leader>q',  ":BufferClose<CR>",                                                                             description = "Close Tab" },
                { '<leader>nn', ':Neorg index<CR>',                                                                             description = "Neorg Open Index" },
                { '<C-d>',      "<C-d>zz",                                                                                      description = "Move Down with Cursor in the Middle" },
                { '<C-u>',      "<C-u>zz",                                                                                      description = "Move Up with Cursor in the Middle" },
                { 'n',          "nzzzv",                                                                                        description = "Search Up with Cursor in the Middle" },
                { 'N',          "Nzzzv",                                                                                        description = "Search Down with Cursor in the Middle" },
                { '<leader>p',  n = "\"_dP",                                                                                    v = "\"_dP",                                          x = "\"_dP", description = "Paste without resetting Clipboard" },
                { '<C-c>',      i = "<ESC>",                                                                                    description = "Remap ESC" },
                { 'Q',          "<nop>",                                                                                        description = "Unmap Q" },
                { '<leader>f',  function() vim.lsp.buf.format() end,                                                            description = "Format Current Tab" },
                { '<leader>xw', function() require('trouble').toggle("workspace_diagnostics") end,                              description = "Trouble Workspace Diagnostics" },
                { '<leader>xd', function() require('trouble').toggle("document_diagnostics") end,                               description = "Trouble Document Diagnostics" },
                { '<leader>xr', function() require('trouble').toggle("lsp_references") end,                                     description = "Trouble LSP References" },
                { '<leader>tc', ":TodoTelescope<CR>",                                                                           description = "Show ToDo-Comments" },
                { '<leader>ee', ":AerialToggle left<CR>",                                                                       description = "Show Code-Outline" },
                { '<leader>s',  [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],                                         description = "Replace Current Word" },
            }
        })
    end
}
