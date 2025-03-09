vim.api.nvim_create_autocmd("BufLeave", {
    pattern = "*",
    command = "silent! wall",
    group = vim.api.nvim_create_augroup("AutoSaveOnBufLeave", { clear = true }),
})
