return {
    'mrjones2014/legendary.nvim',
    config = function ()
        require('legendary').setup({
            keymaps = {
                {'<leader>ll', ":Legendary<CR>", description = "Telescope Find Files"},
                {'<leader>ff', require("telescope.builtin").find_files, description = "Telescope Find Files"},
                {'<C-p>', require("telescope.builtin").git_files, description = "Telescope Git Files"},
                {'<leader>ps', function() require("telescope.builtin").grep_string({ search = vim.fn.input("Grep > ")}); end, description = "Grep String"},
                {'<leader>u', vim.cmd.UndotreeToggle, description = "Toggle UndoTree"},
                {'<leader>pv', ":NvimTreeToggle<CR>", description = "Toggle Project-View"},
                {'<leader>gg', ":Neogit<CR>", description = "Open Git"},
                {'<C-i>', ":BufferPrevious<CR>", description = "Previous Tab"},
                {'<C-o>', ":BufferNext<CR>", description = "Next Tab"},
                {'<leader>q', ":BufferClose<CR>", description = "Close Tab"},
                {'<leader>nn', ':Neorg index<CR>', description = "Neorg Open Index"},
                {'J', v = ":m '>+1<CR>gv=gv", description = "Move Highlighted Down"},
                {'K', v = ":m '<-2<CR>gv=gv", description = "Move Highlighted Up"},
                {'J', n = "mzJ`z", description = "Append Next Line to Current without Moving"},
                {'<C-d>', "<C-d>zz", description = "Move Down with Cursor in the Middle"},
                {'<C-u>', "<C-u>zz", description = "Move Up with Cursor in the Middle"},
                {'n', "nzzzv", description = "Search Up with Cursor in the Middle"},
                {'N', "Nzzzv", description = "Search Down with Cursor in the Middle"},
                {'N', "Nzzzv", description = "Search Down with Cursor in the Middle"},
                {'<leader>y', n = "\"+y",v = "\"+y",  description = "Copy To System-Clipboard"},
                {'<leader>p', n = "\"_dP",v = "\"_dP",x = "\"_dP",  description = "Paste without resetting Clipboard"},
                {'<C-c>', i = "<ESC>",  description = "Remap ESC"},
                {'Q', "<nop>",  description = "Unmap Q"},
                {'<leader>f', function () vim.lsp.buf.format()  end,  description = "Format Current Tab"},
                {'<leader>xx', function () require('trouble').open()  end,  description = "Trouble"},
                {'<leader>xw', function () require('trouble').open("workspace_diagnostics")  end,  description = "Trouble Workspace Diagnostics"},
                {'<leader>xd', function () require('trouble').open("document_diagnostics")  end,  description = "Trouble Document Diagnostics"},
                {'<leader>xq', function () require('trouble').open("quickfix")  end,  description = "Trouble Quickfix"},
                {'<leader>xl', function () require('trouble').open("loclist")  end,  description = "Trouble Loclist"},
                {'<leader>xr', function () require('trouble').open("lsp_references")  end,  description = "Trouble LSP References"},
                {'<leader>tc', ":TodoTelescope<CR>" ,  description = "Show ToDo-Comments"},
                {'<leader>ee', ":AerialToggle<CR>" ,  description = "Show Code-Outline"},
                {'<leader>s', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],  description = "Replace Current Word"},
            }
        })
    end
}
