return {
    'mrjones2014/legendary.nvim',
    config = function()
        require('legendary').setup({
            keymaps = {
                { '<leader>p',   n = "\"_dP",                                                                                    v = "\"_dP",                                          x = "\"_dP",             description = "Paste without resetting Clipboard" },
                { '<leader>ll',  ":Legendary<CR>",                                                                               description = "Show Keymaps" },
                { '<leader>ff',  require("telescope.builtin").find_files,                                                        description = "Telescope Find Files" },
                { '<leader>cb',  ":Telescope neoclip<CR>",                                                                       description = "Show Clipboard" },
                { '<leader>fb',  ":JABSOpen<CR>",                                                                                description = "Manage Buffers" },
                { '<leader>uu',  ":UndotreeToggle<CR>",                                                                          description = "Toggle UndoTree" },
                { '<leader>ps',  function() require("telescope.builtin").grep_string({ search = vim.fn.input("Grep > ") }); end, description = "Grep String" },
                { '<leader>pv',  ":NvimTreeToggle<CR>",                                                                          description = "Toggle Project-View" },
                { '<C-i>',       ":bprevious<CR>",                                                                               description = "Previous Tab" },
                { '<C-o>',       ":bnext<CR>",                                                                                   description = "Next Tab" },
                { '<C-l>',       ":noh<CR>",                                                                                     description = "Redraw" },
                { '<leader>q',   ":bd<CR>",                                                                                       description = "Close Tab" },
                { '<leader>nn',  ':Neorg index<CR>',                                                                             description = "Neorg Open Index" },
                { '<C-d>',       "<C-d>zz",                                                                                      description = "Move Down with Cursor in the Middle" },
                { '<C-u>',       "<C-u>zz",                                                                                      description = "Move Up with Cursor in the Middle" },
                { 'n',           "nzzzv",                                                                                        description = "Search Up with Cursor in the Middle" },
                { 'N',           "Nzzzv",                                                                                        description = "Search Down with Cursor in the Middle" },
                { '<C-c>',       i = "<ESC>",                                                                                    description = "Remap ESC" },
                { 'Q',           "<nop>",                                                                                        description = "Unmap Q" },
                { '<leader>f',   function() vim.lsp.buf.format() end,                                                            description = "Format Current Tab" },
                { '<leader>tc',  ":TodoTelescope<CR>",                                                                           description = "Show ToDo-Comments" },
                { 'K',           ":Lspsaga hover_doc<CR>",                                                                       description = "LSP Show Hover",                       opts = { silent = true } },
                { 'gd',          ":Lspsaga goto_definition<CR>",                                                                 description = "LSP Goto Definition",                  opts = { silent = true } },
                { '<leader>ee',  ":Lspsaga outline<CR>",                                                                         description = "LSP Outline" },
                { '<leader>vca', ":Lspsaga code_action<CR>",                                                                     description = "LSP Code Action" },
                { '<leader>vld', ":Lspsaga show_line_diagnostics<CR>",                                                           description = "LSP Show Line Diagnostics" },
                { '<leader>vbd', ":Lspsaga show_buffer_diagnostics<CR>",                                                         description = "LSP Show Line Diagnostics" },
                { '<leader>vrn', ":Lspsaga rename<CR>",                                                                          description = "LSP Show Line Diagnostics" },
                { '<leader>vrr', ":Lspsaga finder<CR>",                                                                          description = "LSP Show References" },
                { '<leader>vdn', ":Lspsaga diagnostic_jump_next<CR>",                                                            description = "LSP Diagnostic Jump Next" },
                { '<leader>vdp', ":Lspsaga diganostic_jump_prev<CR>",                                                            description = "LSP Diagnostic Jump Previous" },
                { '<leader>vpd', ":Lspsaga peek_definition<CR>",                                                                 description = "LSP Peek Definition" },
                { '<leader>vpt', ":Lspsaga peek_type_definition<CR>",                                                            description = "LSP Peek Type Definition" },
                { '<leader>vwd', ":Lspsaga show_workspace_diagnostics<CR>",                                                      description = "LSP Show Workspace Diagnostics" },
                { '<leader>s',   [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],                                         description = "Replace Current Word" },
            }
        })
    end
}
