hl.config({
	input = {
		kb_layout = "us, th",
		kb_variant = "",
		kb_model = "",
		kb_options = "grp:alt_shift_toggle",
		kb_rules = "",

		follow_mouse = 2,

		sensitivity = 0.3, -- -1.0 - 1.0, 0 means no modification.

		touchpad = {
			scroll_factor = 0.2,
			natural_scroll = true,
		},

		accel_profile = "flat",
	},
})

hl.device({
	name = "asue120c:00-04f3:31c1-touchpad",
	sensitivity = 1,
})
