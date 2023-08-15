vim.g.mapleader = " "

-- Tag Current File
vim.keymap.set("n", "<leader>a", require("grapple").toggle)

-- Untag Current File
vim.keymap.set("n", "<C-g>", require("grapple").untag)

-- List all Tags
vim.keymap.set("n", "<C-e>", ":GrapplePopup tags<CR>")

-- Open File-Explorer
vim.keymap.set("n", "<leader>pv", ":NvimTreeToggle<CR>")

-- Previous Tab
vim.keymap.set("n", "<c-i>", ":BufferPrevious<CR>")

-- Next Tab
vim.keymap.set("n", "<c-o>", ":BufferNext<CR>")

-- Close Tab
vim.keymap.set("n", "<leader>q", ":BufferClose<CR>")

-- Open Terminal
vim.keymap.set('n', '<A-i>', '<CMD>lua require("FTerm").toggle()<CR>')

-- Close Terminal
vim.keymap.set('t', '<A-i>', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')

-- Open Docs
vim.keymap.set("n", "<leader>nn", ":Neorg index<CR>")

-- Open Journal for Today
vim.keymap.set("n", "<leader>nj", ":Neorg journal today<CR>")

-- Move Highlighted Up
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")

-- Move Highlighted Down
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Append next Line to current without moving cursor
vim.keymap.set("n", "J", "mzJ`z")

-- Move Down whith Cursor in the Middle
vim.keymap.set("n", "<C-d>", "<C-d>zz")

-- Move Up with Cursor in the Middle
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Move Up while Searching and Cursor in the Middle
vim.keymap.set("n", "n", "nzzzv")

-- Move Down while Searching and Cursor in the Middle
vim.keymap.set("n", "N", "Nzzzv")

--- Copy to System-Clipboard
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

-- Paste without resetting Clipboard
vim.keymap.set("x", "<leader>p", "\"_dP")
vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

-- Personal Preference and Self-Explanatory
vim.keymap.set("i", "<C-c>", "<ESC>")
vim.keymap.set("n", "Q", "<nop>")

-- Format current File
vim.keymap.set("n", "<leader>f", function()
    vim.lsp.buf.format()
end)

-- Quick-Fix moving
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- Replace current Word
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
