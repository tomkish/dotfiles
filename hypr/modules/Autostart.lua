hl.on("hyprland.start", function ()
	hl.exec_cmd("dbus-run-session gentoo-pipewire-launcher")
    hl.exec_cmd("waybar & awww-daemon")
    hl.exec_cmd("swaync")
end)

hl.on("hyprland.start", function()
    hl.exec_cmd("~/.config/hypr/xdg-portal-hyprland")
end)
