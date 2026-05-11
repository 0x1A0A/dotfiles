local env = hl.env
local config = hl.config
local exec_cmd = hl.exec_cmd

require("input")
require("animation")
require("key_bind")
require("rule")

hl.monitor({
	output = "",
	mode = "highres",
	position = "auto",
	scale = "1",
})

local theme_color = {
	a1 = "rgba(33ccffff)",
	a2 = "rgba(00ff99ff)",
	i1 = "rgba(595959ff)",
	shadow = "rgba(1a1a1aee)",
}

hl.on("hyprland.start", function()
	exec_cmd([[ wl-paste --type text --watch cliphist store #Stores only text data]])
	exec_cmd([[ wl-paste --type image --watch cliphist store #Stores only image data]])
	exec_cmd([[ systemctl --user start hyprpolkitagent]])
	exec_cmd([[ hyprpaper]])
	exec_cmd([[ dunst]])
	exec_cmd([[ /usr/lib/xdg-desktop-portal]])
	exec_cmd([[ dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP DISPLAY]])
end)

local cursor_size = 16

env("XCURSOR_SIZE", tostring(cursor_size))
env("HYPRCURSOR_SIZE", tostring(cursor_size))
env("QT_QPA_PLATFORMTHEME", "qt5ct")
env("XDG_CURRENT_DESKTOP", "Hyprland")
env("XDG_SESSION_DESKTOP", "Hyprland")
env("XDG_SESSION_TYPE", "wayland")

config({
	general = {
		gaps_in = 0,
		gaps_out = 0,

		border_size = 1,

		col = {
			active_border = { colors = { theme_color.a1, theme_color.a2 }, angle = 45 },
			inactive_border = theme_color.i1,
		},

		resize_on_border = false,
		allow_tearing = false,
		layout = "dwindle",
	},

	decoration = {
		rounding = 0,
		rounding_power = 2,

		-- Change transparency of focused and unfocused windows
		active_opacity = 1.0,
		inactive_opacity = 1.0,

		shadow = {
			enabled = false,
			range = 4,
			render_power = 3,
			color = 0xee1a1a1a,
		},

		blur = {
			enabled = false,
			size = 3,
			passes = 1,
			vibrancy = 0.1696,
		},
	},

	animations = {
		enabled = true,
	},
})

config({
	dwindle = {
		preserve_split = true, -- You probably want this
	},
})

config({
	master = {
		new_status = "master",
	},
})

config({
	scrolling = {
		fullscreen_on_one_column = true,
	},
})

config({
	misc = {
		force_default_wallpaper = 0, -- Set to 0 or 1 to disable the anime mascot wallpapers
		disable_hyprland_logo = true, -- If true disables the random hyprland logo / anime girl background. :(
		font_family = "FiraCode Nerd Font Mono, Noto Sans Thai",
	},

	group = {
		drag_into_group = 2,
		col = {
			border_active = { colors = { theme_color.a1, theme_color.a2 }, angle = 45 },
			border_inactive = theme_color.i1,
		},

		groupbar = {
			indicator_height = 4,
			col = { active = theme_color.a2, inactive = theme_color.i1 },
		},
	},
	cursor = {
		no_warps = true,
	},
})
