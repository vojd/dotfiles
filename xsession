initialize gnome settings daemon
if [ $(which gnome-settings-daemon) ]; then
gnome-settings-daemon 2>/dev/null &
    sleep 0.5
    (
        if [ $(which gconftool-2) ]; then
gconftool-2 -t bool -s /apps/nautilus/preferences/show_desktop false
gconftool-2 -t bool -s /desktop/gnome/volume_manager/automount_drives false
gconftool-2 -t bool -s /apps/gnome_settings_daemon/screensaver/start_screensaver false
gconftool-2 -t bool -s /apps/gnome-keyring/daemon-components/ssh false
gconftool-2 -t bool -s /desktop/gnome/background/draw_background false
gconftool-2 -t bool -s /apps/gnome_settings_daemon/plugins/background/active false
gconftool-2 -t bool -s /apps/gnome_settings_daemon/plugins/ubuntuone/active false
gconftool-2 -t bool -s /apps/gnome_settings_daemon/plugins/xrandr/active false
fi
if [ $(which dconf) ]; then
dconf write /org/gnome/settings-daemon/plugins/media-keys/active false
dconf write /org/gnome/desktop/background/draw-background false
dconf write /org/gnome/desktop/background/show-desktop-icons false
dconf write /org/gnome/desktop/media-handling/automount false
dconf write /org/gnome/desktop/media-handling/automount-open false
dconf write /org/gnome/desktop/media-handling/automount-never true
dconf write /org/gnome/desktop/screensaver/idle-activation-enabled false
dconf write /org/gnome/desktop/sound/event-sounds false
dconf write /org/gnome/settings-daemon/plugins/background/active false
dconf write /org/gnome/settings-daemon/plugins/xsettings/active false
dconf write /org/gnome/settings-daemon/plugins/keyboard/active false
dconf write /org/gnome/settings-daemon/plugins/keybindings/active false
fi
    ) &
fi

exec xmonad
