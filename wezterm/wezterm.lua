local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.color_scheme = "Kanagawa (Gogh)"
config.font = wezterm.font("CaskaydiaCove Nerd Font Mono")
config.font_size = 12.0

config.enable_scroll_bar = true
config.default_domain = "WSL:Ubuntu"

-- Keymaps
config.keys = {
  {
    mods = "CTRL|SHIFT",
    key = "t",
    action = wezterm.action.SpawnCommandInNewTab({ domain = "CurrentPaneDomain", cwd = "~" }),
  },
  {
    mods = "SHIFT|ALT",
    key = "_",
    action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain", cwd = "~" }),
  },
  {
    mods = "SHIFT|ALT",
    key = "+",
    action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain", cwd = "~" }),
  },
  {
    mods = "ALT",
    key = "j",
    action = wezterm.action.ActivatePaneDirection("Down"),
  },
  {
    mods = "ALT",
    key = "k",
    action = wezterm.action.ActivatePaneDirection("Up"),
  },
  {
    mods = "ALT",
    key = "h",
    action = wezterm.action.ActivatePaneDirection("Left"),
  },
  {
    mods = "ALT",
    key = "l",
    action = wezterm.action.ActivatePaneDirection("Right"),
  },
}

return config
