local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.color_scheme = "tokyonight_moon"
config.font = wezterm.font("CaskaydiaCove Nerd Font Mono")
config.font_size = 12.0

config.enable_scroll_bar = true

if wezterm.target_triple == 'x86_64-pc-windows-msvc' then
  config.default_domain = "WSL:Ubuntu"
end

-- Keymaps
config.keys = {
  {
    mods = "SHIFT|ALT",
    key = "_",
    action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
  },
  {
    mods = "SHIFT|ALT",
    key = "+",
    action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
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
