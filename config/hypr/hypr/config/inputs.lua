hl.config({
	input = {
		sensitivity = -0.2,
		accel_profile = "flat",
		repeat_rate = 40,
		repeat_delay = 250,
		touchpad = {
			natural_scroll = true,
			scroll_factor = 0.4,
		},
	},
})

hl.gesture({ fingers = 4, direction = "horizontal", action = "workspace" })
hl.gesture({ fingers = 3, direction = "down", action = "close" })
hl.gesture({ fingers = 3, direction = "up", action = "fullscreen" })
hl.gesture({ fingers = 3, direction = "left", action = "float" })
