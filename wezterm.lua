local wezterm = require("wezterm")
local config = wezterm.config_builder()

--- 実行環境がmacosか否か判定
-- @return boolean true: macos, false: macos以外
local function macp()
  return wezterm.target_triple:find("apple%-darwin") ~= nil
end

--- 実行環境がlinuxか否か判定
-- @return boolean true: linux, false: linux以外
local function linuxp()
  return wezterm.target_triple:find("linux") ~= nil
end

--- 実行環境がwindowsか否か判定
-- @return boolean true: windows, false: windows以外
local function windowsp()
  return wezterm.target_triple:find("windows") ~= nil
end

-- 設定自動再読み込み
config.automatically_reload_config = true

-- 終了確認するか
config.window_close_confirmation = "NeverPrompt"

-- 色
config.colors = require 'colors.kanagawa-lotus'

-- フォント
if macp() then
  config.font_size = 18
  config.font = wezterm.font_with_fallback({
    { family = "SauceCodePro Nerd Font", weight = "Regular" },
    { family = "Hiragino Sans", weight = "Regular", scale = 1.0 }
  })
elseif linuxp() then
elseif windowsp() then
  config.font_size = 14
  config.font = wezterm.font_with_fallback({
    { family = "JetBrains Mono", weight = "Regular" },
    { family = "BIZ UDGothic", weight = "Regular" },
    { family = "Segoe UI Emoji", weight = "Regular" },
  })
end

-- IMEを使うか
config.use_ime = true

-- ウィンドウの装飾
-- RESIZE: タイトルバー無効、サイズ変更は可能
config.window_decorations = "RESIZE"

-- 透過
config.window_background_opacity = 0.88

-- 裏側の暈し
config.macos_window_background_blur = 10

-- タブバーの見た目
--   true: OS標準的、可変幅フォント
--   false: レトロ、等幅フォント
config.use_fancy_tab_bar = false

-- タブが一つならタブバー非表示
--config.hide_tab_bar_if_only_one_tab = true

-- 新規タブボタン表示
config.show_new_tab_button_in_tab_bar = false

-- キー割り当て
local keys = {}

if macp() then
  -- macでバックスラッシュが入力できない問題の対策
  table.insert(keys, { key = '¥', mods = 'OPT', action = wezterm.action.SendKey { key = '\\', mods = 'NONE' }})
end

config.keys = keys

return config
