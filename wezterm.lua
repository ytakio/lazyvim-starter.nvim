-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- Window size
config.initial_cols = 104
config.initial_rows = 29

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
-- config.color_scheme = 'OneDark (base16)'
config.color_scheme = "Tokyo Night"
config.colors = {
	scrollbar_thumb = "#000000",
}

-- config.default_domain = "WSL:Ubuntu"
config.font = wezterm.font("HackGen35 Console NF")
config.font_size = 14.0

config.window_background_opacity = 0.9
config.window_padding = {
	right = 10,
}
config.enable_scroll_bar = true
-- enable capability of graphics
-- config.kitty_graphics = true
-- and finally, return the configuration to wezterm
return config
