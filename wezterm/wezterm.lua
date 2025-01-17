local wezterm = require("wezterm")

local config = {}

if wezterm.config_builder then
    config = wezterm.config_builder()
end
config.front_end = "Software"


config.font_size = 18
config.line_height = 1.2

config.font = wezterm.font(
    'FiraCode Nerd Font',
    { weight = 'Regular' }
)

config.underline_position = -4
config.underline_thickness = 2

config.window_decorations = "RESIZE"
config.enable_tab_bar = false
config.scrollback_lines = 3500
config.window_close_confirmation = "NeverPrompt"

config.use_fancy_tab_bar = false
config.show_new_tab_button_in_tab_bar = false
config.tab_max_width = 22
config.window_padding = {
    left = 10,
    right = 0,
    top = 10,
    bottom = 0,
}

config.colors = require("color")
config.window_background_opacity = 0.75
config.macos_window_background_blur = 40

return config
