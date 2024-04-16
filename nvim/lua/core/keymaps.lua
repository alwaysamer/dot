-- Map Leader
vim.g.mapleader = " "

-- Previous Buffer
vim.keymap.set("n", "<C-i>", ":bprevious<CR>", { silent = true })

-- Next Buffer
vim.keymap.set("n", "<C-o>", ":bnext<CR>", { silent = true })

-- Redraw
vim.keymap.set("n", "<C-l>", ":noh<CR>", { silent = true })

-- Close Buffer
vim.keymap.set("n", "<leader>q", ":bd<CR>", { silent = true })

-- Move Down with Cursor in the Middle
vim.keymap.set("n", "<C-d>", "<C-d>zz", { silent = true })

-- Move Up with Cursor in the Middle
vim.keymap.set("n", "<C-u>", "<C-u>zz", { silent = true })

-- Search Up with Cursor in the Middle
vim.keymap.set("n", "n", "nzzzv", { silent = true })

-- Search Down with Cursor in the Middle
vim.keymap.set("n", "N", "Nzzzv", { silent = true })

-- Remap ESC
vim.keymap.set("i", "<C-c>", "<ESC>", { silent = true })

-- Unmap Q
vim.keymap.set("n", "Q", "<nop>", { silent = true })

-- Format Current Buffer
vim.keymap.set("n", "<leader>f", function() vim.lsp.buf.format() end, { silent = true })

-- Replace Current Word
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { silent = true })

-- Move Line Down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { silent = true })

-- Move Line Up
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { silent = true })

-- Join Lines
vim.keymap.set("n", "J", "mzJ`z", { silent = true })
