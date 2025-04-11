vim.api.nvim_create_autocmd("BufLeave", {
    pattern = "*",
    command = "silent! wall",
    group = vim.api.nvim_create_augroup("AutoSaveOnBufLeave", { clear = true }),
})
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    vim.cmd("delmarks A-Z0-9 | wshada!")
  end,
})
