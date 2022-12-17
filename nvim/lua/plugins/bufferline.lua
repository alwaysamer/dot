require('bufferline').setup({
    options = {
      view = "multiwindow",
      numbers = "none",
      modified_icon = '●',
      left_trunc_marker = '',
      right_trunc_marker = '',
      show_buffer_icons=false,
      max_name_length = 18,
      max_prefix_length = 25, -- prefix used when a buffer is deduplicated
      tab_size = 25,
      diagnostics ="nvim_lsp",
      themable = true,
      show_tab_indicators = false,
      enforce_regular_tabs = false,
      indicator = { 
          icon = '▎',
          style = 'icon',
      },
      show_buffer_close_icons = false,
      show_close_icon = false,
      offsets = {{filetype = "NvimTree", text="", padding=1}},
      diagnostics_indicator = function(count, level, diagnostics_dict, context)
        local icon = level:match("error") and " " or " "
        return " " .. icon .. count
        end,
      separator_style = {"", ""}
    }
  })
