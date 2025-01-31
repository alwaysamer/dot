return {
    'tanvirtin/vgit.nvim',
    branch = 'v1.0.x',
    dependencies = { 'nvim-lua/plenary.nvim' },
    event = 'VimEnter',
    config = function()
        require("vgit").setup({
            keymaps = {
                ['n <leader>gd'] = function() require('vgit').project_diff_preview() end,
            }
        })
    end,
    keys = {

    }
}
