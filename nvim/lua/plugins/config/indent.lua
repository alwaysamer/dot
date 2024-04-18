return {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {},
    config = function()
        local indent = "IndentBlank"
        local scope = "ScopeIndent"
        local hooks = require "ibl.hooks"
        hooks.register(hooks.type.HIGHLIGHT_SETUP, function ()
            vim.api.nvim_set_hl(0, indent, { fg = "#4d4d4d" })
            vim.api.nvim_set_hl(0, scope, { fg = "#e95678" })
        end)
        require("ibl").setup({
            indent = {
                highlight = indent,
            },
            scope = {
                show_start = false,
                show_end = false,
                highlight = scope,
            },
        })
        hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
    end,
}
