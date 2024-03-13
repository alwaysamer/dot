return
{
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
  },
  config = function ()
      require("notify").setup({
          level = vim.log.levels.INFO,
          fps = 30,
          render = "wrapped-compact",
          timeout = 500,
      })

      require("noice").setup({
            lsp = {
                override = {
                    ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                    ["vim.lsp.util.stylize_markdown"] = true,
                    ["cmp.entry.get_documentation"] = true,
                },
            },
            cmdline = {
                view = "cmdline",
            },
            presets = {
                bottom_search = true,
                command_palette = false,
                long_message_to_split = true,
                inc_rename = false,
                lsp_doc_border = false,
            },
    })
  end
}
