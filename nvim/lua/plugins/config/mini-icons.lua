return {
    "echasnovski/mini.icons",
    opts = {},
    lazy = true,
    config = function()
        require("mini.icons").setup()
        require("mini.icons").mock_nvim_web_devicons()
    end,
}
