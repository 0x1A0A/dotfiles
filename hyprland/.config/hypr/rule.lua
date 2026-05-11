local window_rule = hl.window_rule

local layer_rule = hl.layer_rule

local suppressMaximizeRule = window_rule({
	name = "suppress-maximize-events",
	match = { class = ".*" },

	suppress_event = "maximize",
})

suppressMaximizeRule:set_enabled(true)

window_rule({
	name = "fix-xwayland-drags",
	match = {
		class = "^$",
		title = "^$",
		xwayland = true,
		float = true,
		fullscreen = false,
		pin = false,
	},

	no_focus = true,
})

window_rule({
	name = "auth-agent-float",
	match = {
		class = "^org.kde.polkit-kde-authentication-agent-1$",
		float = true,
	},

	no_focus = true,
})

window_rule({
	name = "move-hyprland-run",
	match = { class = "hyprland-run" },

	move = "20 monitor_h-120",
	float = true,
})

layer_rule({
	name = "no-anim-rofi",
	match = { title = "^rofi$" },
	no_anim = true,
})
