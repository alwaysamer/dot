return {
    "MagicDuck/grug-far.nvim",
    config = function ()
        require('grug-far').setup();
        vim.keymap.set("n", "<leader>rp", "<cmd>GrugFar<CR>",
            { silent = true, desc = "GrugFar Replace" })
    end
}
