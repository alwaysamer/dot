return {
    "mistricky/codesnap.nvim",
    build = "make build_generator",
    keys = {
        { "<leader>cc", "<cmd>CodeSnap<cr>", mode = "x", desc = "Save selected code snapshot into clipboard" },
    },
    opts = {
        mac_window_bar = true,
        title = "CodeSnap.nvim",
        code_font_family = "CaskaydiaCove Nerd Font",
        watermark = "",
        bg_theme = "default",
        has_breadcrumbs = false,
        has_line_number = true,
        show_workspace = false,
    }
}
