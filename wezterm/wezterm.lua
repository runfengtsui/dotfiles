local wezterm = require("wezterm")

local config = {
  color_scheme = "Catppuccin Mocha",

  -- 字体大小
  font_size = 16,
  -- 字体样式
  font = wezterm.font(
    "FiraCode Nerd Font",
    { weight = "Regular" }
  ),
  -- 字体透明度
  text_background_opacity = 0.6,

  -- 顶部状态栏的样式
  use_fancy_tab_bar = false,
  -- 只有一个窗口时隐藏顶部状态栏
  hide_tab_bar_if_only_one_tab = true,
  -- 隐藏新建窗口的加号
  show_new_tab_button_in_tab_bar = false,
  -- 窗口装饰
  window_decorations = "RESIZE",
  -- 窗口透明度
  window_background_opacity = 0.6,
  adjust_window_size_when_changing_font_size = false,
  macos_window_background_blur = 70,
  -- 窗口边距
  window_padding = {
    left = 20,
    right = 20,
    top = 20,
    bottom = 5,
  },
}

return config
