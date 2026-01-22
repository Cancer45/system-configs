# set cursor theme & size -- ~/.Xresources
xrdb -merge ~/.Xresources

# set X11 keybinds -- ~/.xbindkeysrc
xbindkeys

# touchpad settings -- /etc/X11/xorg.conf.d/90-touchpad.conf

# set wallpaper
feh --bg-scale ~/Media/Wallpapers/purple_mess.png

# set nightlight
redshift -O 3500

# start compositor -- /etc/xdg/picom.conf
picom &

# set bar
slstatus &

# start WM
exec dwm
