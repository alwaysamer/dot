return {
    'tanvirtin/vgit.nvim',
    branch = 'v1.0.x',
    dependencies = { 'nvim-lua/plenary.nvim' },
    event = 'VimEnter',
    config = function()
        require("vgit").setup({
            keymaps = {
                ['n <leader>gd'] = function() require('vgit').project_diff_preview() end,
                ['n <C-k>'] = function() require('vgit').hunk_up() end,
                ['n <C-j>'] = function() require('vgit').hunk_down() end,
            },
            settings = {
                live_blame = {
                    enabled = false,
                },
            },
        })
    end,
}
