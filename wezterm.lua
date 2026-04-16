-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices.

-- or, changing the font size and color scheme.
config.font_size = 14
config.color_scheme = "nord"
config.font = wezterm.font("JetBrains Mono")

-- Keybindings
config.keys = {
  -- cmd-enter / cmd-i: split pane vertically (left/right)
  {
    key = "Enter",
    mods = "CMD",
    action = wezterm.action.SplitPane { direction = "Down" },
  },
  {
    key = "i",
    mods = "CMD",
    action = wezterm.action.SplitPane { direction = "Right" },
  },
  -- cmd-j: activate next pane
  {
    key = "j",
    mods = "CMD",
    action = wezterm.action.ActivatePaneDirection "Next",
  },
  -- cmd-l: toggle zoom for current pane
  {
    key = "l",
    mods = "CMD",
    action = wezterm.action.TogglePaneZoomState,
  },
}

-- Finally, return the configuration to wezterm:
return config
