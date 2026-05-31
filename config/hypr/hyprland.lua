MAIN_MOD = "SUPER"
TERMINAL = "alacritty"
FILE_MANAGER = "nautilus"

require("modules.keybinds")
require("modules.window_rules")
require("modules.workspace_rules")
require("modules.look")
require("modules.configs")

hl.monitor({ output = "HDMI-A-2", mode = "2560x2880@60", position = "0x0", scale = "1.25" })
hl.monitor({ output = "HDMI-A-1", mode = "2560x1440@120", position = "2048x720", scale = "1" })
hl.monitor({ output = "eDP-2", mode = "2560x1600@165", position = "0x0", scale = "1.25" })

hl.on("hyprland.start", function()
	hl.exec_cmd(TERMINAL)
	hl.exec_cmd("/home/hacky/hacky_nix/scripts/startup.sh")
	-- hl.exec_cmd("startup.sh")
end)

hl.env("XCURSOR_SIZE", "22")
hl.env("HYPRCURSOR_SIZE", "22")

hl.permission("/usr/(bin|local/bin)/grim", "screencopy", "allow")
hl.permission("/usr/(lib|libexec|lib64)/xdg-desktop-portal-hyprland", "screencopy", "allow")
hl.permission("/usr/(bin|local/bin)/hyprpm", "plugin", "allow")
