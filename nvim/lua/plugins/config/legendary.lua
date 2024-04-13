return {
    'mrjones2014/legendary.nvim',
    config = function()
        require('legendary').setup({
            keymaps = {
                { '<leader>p',   n = "\"_dP",                                                                                    v = "\"_dP",                                          x = "\"_dP",             description = "Paste without resetting Clipboard", opts = { silent = true } },
                { '<leader>ll',  ":Legendary<CR>",                                                                               description = "Show Keymaps", opts = { silent = true } },
                { '<leader>ff',  require("telescope.builtin").find_files,                                                        description = "Telescope Find Files", opts = { silent = true } },
                { '<leader>cb',  ":Telescope neoclip<CR>",                                                                       description = "Show Clipboard", opts = { silent = true } },
                { '<leader>fb',  ":JABSOpen<CR>",                                                                                description = "Manage Buffers", opts = { silent = true } },
                { '<leader>uu',  ":UndotreeToggle<CR>",                                                                          description = "Toggle UndoTree", opts = { silent = true } },
                { '<leader>ps',  function() require("telescope.builtin").grep_string({ search = vim.fn.input("Grep > ") }); end, description = "Grep String" , opts = { silent = true }},
                { '<leader>pv',  ":Oil --float<CR>",                                                                             description = "Toggle Project-View", opts = { silent = true } },
                { '<C-i>',       ":bprevious<CR>",                                                                               description = "Previous Tab", opts = { silent = true } },
                { '<C-o>',       ":bnext<CR>",                                                                                   description = "Next Tab", opts = { silent = true } },
                { '<C-l>',       ":noh<CR>",                                                                                     description = "Redraw", opts = { silent = true } },
                { '<leader>q',   ":bd<CR>",                                                                                      description = "Close Tab", opts = { silent = true } },
                { '<leader>nn',  ':Neorg index<CR>',                                                                             description = "Neorg Open Index", opts = { silent = true } },
                { '<C-d>',       "<C-d>zz",                                                                                      description = "Move Down with Cursor in the Middle", opts = { silent = true } },
                { '<C-u>',       "<C-u>zz",                                                                                      description = "Move Up with Cursor in the Middle", opts = { silent = true } },
                { 'n',           "nzzzv",                                                                                        description = "Search Up with Cursor in the Middle", opts = { silent = true } },
                { 'N',           "Nzzzv",                                                                                        description = "Search Down with Cursor in the Middle", opts = { silent = true } },
                { '<C-c>',       i = "<ESC>",                                                                                    description = "Remap ESC", opts = { silent = true } },
                { 'Q',           "<nop>",                                                                                        description = "Unmap Q", opts = { silent = true } },
                { '<leader>f',   function() vim.lsp.buf.format() end,                                                            description = "Format Current Tab", opts = { silent = true } },
                { '<leader>tc',  ":TodoTelescope<CR>",                                                                           description = "Show ToDo-Comments", opts = { silent = true } },
                { 'K',           ":Lspsaga hover_doc<CR>",                                                                       description = "LSP Show Hover",                       opts = { silent = true } },
                { 'gd',          ":Lspsaga goto_definition<CR>",                                                                 description = "LSP Goto Definition",                  opts = { silent = true } },
                { '<leader>ee',  ":Lspsaga outline<CR>",                                                                         description = "LSP Outline", opts = { silent = true } },
                { '<leader>vca', ":Lspsaga code_action<CR>",                                                                     description = "LSP Code Action", opts = { silent = true } },
                { '<leader>vld', ":Lspsaga show_line_diagnostics<CR>",                                                           description = "LSP Show Line Diagnostics", opts = { silent = true } },
                { '<leader>vbd', ":Lspsaga show_buffer_diagnostics<CR>",                                                         description = "LSP Show Line Diagnostics", opts = { silent = true } },
                { '<leader>vrn', ":Lspsaga rename<CR>",                                                                          description = "LSP Show Line Diagnostics", opts = { silent = true } },
                { '<leader>vrr', ":Lspsaga finder<CR>",                                                                          description = "LSP Show References", opts = { silent = true } },
                { '<leader>vdn', ":Lspsaga diagnostic_jump_next<CR>",                                                            description = "LSP Diagnostic Jump Next", opts = { silent = true } },
                { '<leader>vdp', ":Lspsaga diganostic_jump_prev<CR>",                                                            description = "LSP Diagnostic Jump Previous", opts = { silent = true } },
                { '<leader>vpd', ":Lspsaga peek_definition<CR>",                                                                 description = "LSP Peek Definition", opts = { silent = true } },
                { '<leader>vpt', ":Lspsaga peek_type_definition<CR>",                                                            description = "LSP Peek Type Definition", opts = { silent = true } },
                { '<leader>vwd', ":Lspsaga show_workspace_diagnostics<CR>",                                                      description = "LSP Show Workspace Diagnostics", opts = { silent = true } },
                { '<leader>s',   [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],                                         description = "Replace Current Word", opts = { silent = true } },
            }
        })
    end
}
