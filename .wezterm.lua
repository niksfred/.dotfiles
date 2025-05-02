-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = {}
if wezterm.config_builder then
	config = wezterm.config_builder()
end


-- Look configs
config.color_scheme = "Catppuccin Macchiato"
config.use_fancy_tab_bar = false
config.window_decorations = "RESIZE"
config.window_background_opacity = 0.95
config.font = wezterm.font("FiraCode Nerd Font", { weight = "DemiBold" })
config.font_size = 12

config.underline_position = "-2pt"
config.underline_thickness = "1.5pt"

config.window_close_confirmation = "AlwaysPrompt"
config.default_workspace = "home"

-- dim inactive panes
config.inactive_pane_hsb = {
	saturation = 0.75,
	brightness = 0.75,
}

local is_windows = wezterm.target_triple == 'x86_64-pc-windows-msvc'
if is_windows then
	config.default_domain = 'WSL:Ubuntu'
	config.window_background_opacity = 0
	config.win32_system_backdrop = 'Acrylic'
end

-- Keys config
config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 1000 }
config.keys = {
	{
		key = "n",
		mods = "SHIFT|CTRL",
		action = wezterm.action.ToggleFullScreen,
	},
	{
		key = "c",
		mods = "LEADER",
		action = wezterm.action.ActivateCopyMode,
	},

	-- Panes
	{
		key = "-",
		mods = "LEADER",
		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "|",
		mods = "LEADER|SHIFT",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "h",
		mods = "LEADER",
		action = wezterm.action.ActivatePaneDirection("Left"),
	},
	{
		key = "j",
		mods = "LEADER",
		action = wezterm.action.ActivatePaneDirection("Down"),
	},
	{
		key = "k",
		mods = "LEADER",
		action = wezterm.action.ActivatePaneDirection("Up"),
	},
	{
		key = "l",
		mods = "LEADER",
		action = wezterm.action.ActivatePaneDirection("Right"),
	},
	{
		key = "x",
		mods = "LEADER",
		action = wezterm.action.CloseCurrentPane({ confirm = true }),
	},
	{
		key = "z",
		mods = "LEADER",
		action = wezterm.action.TogglePaneZoomState,
	},
	{
		key = "s",
		mods = "LEADER",
		action = wezterm.action.RotatePanes("Clockwise"),
	},

	-- Keytable for pane resize
	{
		key = "r",
		mods = "LEADER",
		action = wezterm.action.ActivateKeyTable({ name = "resize_pane", one_shot = false }),
	},

	-- Tabs
	{
		key = "n",
		mods = "LEADER",
		action = wezterm.action.SpawnCommandInNewTab {
      domain = "CurrentPaneDomain",
      cwd = "~"
    }
	},
	{
		key = "[",
		mods = "LEADER",
		action = wezterm.action.ActivateTabRelative(-1),
	},
	{
		key = "]",
		mods = "LEADER",
		action = wezterm.action.ActivateTabRelative(1),
	},
	{
		key = "t",
		mods = "LEADER",
		action = wezterm.action.ShowTabNavigator,
	},
}

-- Index tab navigation
for i = 1, 9 do
	table.insert(config.keys, {
		key = tostring(i),
		mods = "LEADER",
		action = wezterm.action.ActivateTab(i - 1),
	})
end

config.key_tables = {
	resize_pane = {
		{ key = "h", action = wezterm.action.AdjustPaneSize({ "Left", 1 }) },
		{ key = "j", action = wezterm.action.AdjustPaneSize({ "Down", 1 }) },
		{ key = "k", action = wezterm.action.AdjustPaneSize({ "Up", 1 }) },
		{ key = "l", action = wezterm.action.AdjustPaneSize({ "Right", 1 }) },
		{ key = "Escape", action = "PopKeyTable" },
		{ key = "Enter", action = "PopKeyTable" },
	},
}

-- and finally, return the configuration to wezterm
return config
