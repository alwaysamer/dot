return {
    "epwalsh/obsidian.nvim",
    version = "*",
    -- ft = "markdown",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    config = function ()
        require("obsidian").setup({
            workspaces = {
                {
                    name = "personal",
                    path = "~/vaults/personal",
                },
                {
                    name = "work",
                    path = "~/vaults/work",
                },
            },
        })
    end
}
