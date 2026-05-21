local wezterm = require("wezterm")
local config = wezterm.config_builder()

local color_scheme = 'Solarized Light (Gogh)'

config.automatically_reload_config = true
config.window_close_confirmation = "NeverPrompt"

config.font_size = 16
config.font = wezterm.font_with_fallback({
  { family = "SauceCodePro Nerd Font", weight = "Regular" },

  { family = "Hiragino Sans", weight = "Regular", scale = 1.0 }
})

config.window_decorations = "RESIZE"
config.window_background_opacity = 0.8
config.macos_window_background_blur = 10
config.color_scheme = color_scheme

config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.show_new_tab_button_in_tab_bar = false

-- タブの色をカラースキームと同じにする
local scheme_def = wezterm.color.get_builtin_schemes()[color_scheme]
config.colors = {
  tab_bar = {
    active_tab = {
      bg_color = scheme_def.background,
      fg_color = scheme_def.foreground,
    }
  }
}

return config
