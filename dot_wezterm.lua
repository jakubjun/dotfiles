-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
-- config.color_scheme = 'AdventureTime'
-- config.window_background_opacity = 0.85
config.font = wezterm.font("CaskaydiaCove Nerd Font Mono")
config.enable_tab_bar = false
-- config.window_decorations = "RESIZE"
--
config.color_scheme = "Tokyo Night"

-- and finally, return the configuration to wezterm
return config
