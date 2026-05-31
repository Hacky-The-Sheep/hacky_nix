hl.workspace_rule({
	workspace = "3",
	layout = "scrolling",
	layout_opts = {
		direction = "right",
	},
})

hl.window_rule({
	match = {
		title = "^Signal$",
	},
	workspace = "1",
})

hl.window_rule({
	match = {
		initial_class = "brave-browser",
	},
	workspace = "2",
})

hl.window_rule({
	match = {
		initial_class = "microsoft-edge",
	},
	workspace = "3",
})

hl.window_rule({
	match = {
		initial_title = "Fragments",
	},
	workspace = "4",
})
