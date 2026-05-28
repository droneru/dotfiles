-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices.

-- or, changing the font size and color scheme.
config.font_size = 15
config.color_scheme = "nord"
config.font = wezterm.font("JetBrains Mono")
config.window_decorations = "RESIZE"

-- tab bar
config.hide_tab_bar_if_only_one_tab = false
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false

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
