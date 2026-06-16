local MAIN_MOD = "SUPER" -- Sets "Windows" key as main modifier

-- Example binds, see https://wiki.hypr.land/Configuring/Basics/Binds/ for more
hl.bind(MAIN_MOD .. " + T", hl.dsp.exec_cmd(TERMINAL))
local closeWindowBind = hl.bind(MAIN_MOD .. " + Q", hl.dsp.window.close())
hl.bind(
	MAIN_MOD .. " + SHIFT + E",
	hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'")
)
hl.bind(MAIN_MOD .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(MAIN_MOD .. " + R", hl.dsp.exec_cmd("noctalia msg panel-toggle launcher"))
hl.bind(MAIN_MOD .. " + P", hl.dsp.window.pseudo())
hl.bind(MAIN_MOD .. " + L", hl.dsp.exec_cmd("noctalia msg session lock"))

-- Screenshot
hl.bind(MAIN_MOD .. " + S", hl.dsp.exec_cmd("/home/hacky/hacky_nix/scripts/screenshot.sh"))

-- Move focus with MAIN_MOD + arrow keys
hl.bind(MAIN_MOD .. " + left", hl.dsp.focus({ direction = "left" }))
hl.bind(MAIN_MOD .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(MAIN_MOD .. " + up", hl.dsp.focus({ direction = "up" }))
hl.bind(MAIN_MOD .. " + down", hl.dsp.focus({ direction = "down" }))

-- Switch workspaces with MAIN_MOD + [0-9]
-- Move active window to a workspace with MAIN_MOD + SHIFT + [0-9]
for i = 1, 10 do
	local key = i % 10 -- 10 maps to key 0
	hl.bind(MAIN_MOD .. " + CTRL + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind(MAIN_MOD .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Example special workspace (scratchpad)
-- hl.bind(MAIN_MOD .. " + S",         hl.dsp.workspace.toggle_special("magic"))
-- hl.bind(MAIN_MOD .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through existing workspaces with MAIN_MOD + scroll
hl.bind(MAIN_MOD .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(MAIN_MOD .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with MAIN_MOD + LMB/RMB and dragging
hl.bind(MAIN_MOD .. " + ALT + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(MAIN_MOD .. " + ALT + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Laptop multimedia keys for volume and LCD brightness
hl.bind(
	"XF86AudioRaiseVolume",
	hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioLowerVolume",
	hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMicMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
	{ locked = true, repeating = true }
)
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

-- CENTER MODE!!
hl.bind("SUPER + C", function()
	hl.dispatch(hl.dsp.window.float({ action = "toggle" }))
	hl.dispatch(hl.dsp.exec_cmd("hyprctl dispatch resizeactive exact 65% 85%"))
	hl.dispatch(hl.dsp.window.center())
end, { description = "Niri-style center column snap" })

-- Fullscreen Binding
hl.bind(
	"SUPER + F",
	hl.dsp.window.fullscreen({
		mode = "maximized",
		action = "toggle",
	})
)
