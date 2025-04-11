vim.api.nvim_create_autocmd("BufLeave", {
    pattern = "*",
    command = "silent! wall",
    group = vim.api.nvim_create_augroup("AutoSaveOnBufLeave", { clear = true }),
})
vim.api.nvim_create_autocmd("VimLeavePre", {
  callback = function()
    vim.cmd("delmarks A-Z")
  end,
})
