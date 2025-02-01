vim.api.nvim_create_autocmd("BufLeave", {
    pattern = "*",
    command = "silent! wall",
    group = vim.api.nvim_create_augroup("AutoSaveOnBufLeave", { clear = true }),
})

vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    command = [[%s/\s\+$//e]],
    group = vim.api.nvim_create_augroup("TrimWhitespace", { clear = true }),
})
