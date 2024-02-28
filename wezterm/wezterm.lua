local wezterm = require("wezterm")
local act = wezterm.action
local config = {}

-- Spawn a fish shell in login mode
config.default_prog = { '/usr/local/bin/fish', '-l' }

config.color_scheme = "Catppuccin Mocha"

-- 字体大小
config.font_size = 16
-- 字体样式
config.font = wezterm.font(
  "FiraCode Nerd Font",
  { weight = "Regular" }
)
-- 字体透明度
config.text_background_opacity = 0.6

-- tab bar
config.enable_tab_bar = true
-- 只有一个窗口时隐藏顶部状态栏
config.hide_tab_bar_if_only_one_tab = true
-- 顶部状态栏的样式
config.use_fancy_tab_bar = false
-- 隐藏新建窗口的加号
config.show_new_tab_button_in_tab_bar = false

-- window
-- 窗口装饰
config.window_decorations = "RESIZE"
-- 窗口透明度
config.window_background_opacity = 0.6
config.adjust_window_size_when_changing_font_size = false
config.macos_window_background_blur = 70
-- 窗口边距, 仅留下右端滚动条的宽度
config.window_padding = {
  left = 0,
  right = 15,
  top = 0,
  bottom = 0,
}
-- scroll bar
config.enable_scroll_bar = true

-- 取消所有默认快捷键
config.disable_default_key_bindings = true
-- leader
config.leader = {
  key = "a",
  mods = "CTRL"
}
config.keys = {
  -- split pane vertically or horizontally
  {
    key = "-",
    mods = "LEADER",
    action = act.SplitVertical {
      domain = "CurrentPaneDomain"
    }
  },
  {
    key = "=",
    mods = "LEADER",
    action = act.SplitHorizontal {
      domain = "CurrentPaneDomain"
    }
  },
  -- pane navigation
  {
    key = "h",
    mods = "LEADER",
    action = act {
      ActivatePaneDirection = "Left"
    }
  },
  {
    key = "j",
    mods = "LEADER",
    action = act {
      ActivatePaneDirection = "Down"
    }
  },
  {
    key = "k",
    mods = "LEADER",
    action = act {
      ActivatePaneDirection = "Up"
    }
  },
  {
    key = "l",
    mods = "LEADER",
    action = act {
      ActivatePaneDirection = "Right"
    }
  },
  -- Toggles the zoom state of the current pane.
  {
    key = "f",
    mods = "LEADER",
    action = act.TogglePaneZoomState
  },
  -- paste from the clipboard
  {
    key = "V",
    mods = "CTRL",
    action = act.PasteFrom 'Clipboard'
  },
}


return config

