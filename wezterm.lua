local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.colors = require 'colors.kanagawa-lotus'

local function is_mac()
  return wezterm.target_triple:find("apple%-darwin") ~= nil
end

local function is_linux()
  return wezterm.target_triple:find("linux") ~= nil
end

local function is_windows()
  return wezterm.target_triple:find("windows") ~= nil
end

config.automatically_reload_config = true
config.window_close_confirmation = "NeverPrompt"

if is_mac() then
  config.font_size = 18
  config.font = wezterm.font_with_fallback({
    { family = "SauceCodePro Nerd Font", weight = "Regular" },
    { family = "Hiragino Sans", weight = "Regular", scale = 1.0 }
  })
elseif is_linux() then
elseif is_windows() then
  config.font_size = 14
  config.font = wezterm.font_with_fallback({
    { family = "JetBrains Mono", weight = "Regular" },
    { family = "BIZ UDGothic", weight = "Regular" },
    { family = "Segoe UI Emoji", weight = "Regular" },
  })
end

config.use_ime = true

config.window_decorations = "RESIZE"
config.window_background_opacity = 0.8
config.macos_window_background_blur = 10
config.color_scheme = color_scheme

config.use_fancy_tab_bar = false
--config.hide_tab_bar_if_only_one_tab = true
config.show_new_tab_button_in_tab_bar = false

local keys = {}

if is_mac() then
  -- macでバックスラッシュが入力できない問題の対策
  table.insert(keys, { key = '¥', mods = 'OPT', action = wezterm.action.SendKey { key = '\\', mods = 'NONE' }})
end

config.keys = keys

return config
