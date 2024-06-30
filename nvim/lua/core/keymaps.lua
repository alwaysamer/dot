vim.g.mapleader = " "
vim.keymap.set("n", "<leader>q", ":bd<CR>", { silent = true, desc = "Buffer Close" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { silent = true })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { silent = true })
vim.keymap.set("n", "<C-i>", ":bp<CR>", { silent = true, desc = "Buffer Previous" })
vim.keymap.set("n", "<C-o>", ":bn<CR>", { silent = true, desc = "Buffer Next" })
vim.keymap.set("n", "n", "nzzzv", { silent = true })
vim.keymap.set("n", "N", "Nzzzv", { silent = true })
vim.keymap.set("i", "<C-c>", "<ESC>", { silent = true })
vim.keymap.set("n", "Q", "<nop>", { silent = true })
vim.keymap.set("n", "<leader>f", function() vim.lsp.buf.format() end, { silent = true, desc = "LSP Format Buffer" })
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
    { silent = true, desc = "Buffer Replace" })
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { silent = true, desc = "Line Move Down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { silent = true, desc = "Line Move Up" })
