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
	{
		key = "Enter",
		mods = "CMD",
		action = wezterm.action.SplitPane({ direction = "Down" }),
	},
	{
		key = "i",
		mods = "CMD",
		action = wezterm.action.SplitPane({ direction = "Right" }),
	},
	{
		key = "j",
		mods = "CMD",
		action = wezterm.action.ActivatePaneDirection("Next"),
	},
	{
		key = "l",
		mods = "CMD",
		action = wezterm.action.TogglePaneZoomState,
	},
}

-- Finally, return the configuration to wezterm:
return config
