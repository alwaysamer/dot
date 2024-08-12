return {
    "NeogitOrg/neogit",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "sindrets/diffview.nvim",
    },
    cmd = "Neogit",
    config = function()
        local neogit = require("neogit")

        neogit.setup {
            remember_settings = true,
            use_default_keymaps = true,
            kind = "replace",
            auto_refresh = true,
            disable_line_numbers = true,
            auto_close_console = true,
            integrations = {
                diffview = true,
                fzf_lua = true,
            },
        }
    end
}
