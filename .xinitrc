# set cursor theme & size -- ~/.Xresources
xrdb -merge ~/.Xresources

# set ENV vars here
export PATH="$PATH:$HOME/.local/bin"
export _JAVA_AWT_WM_NONREPARENTING=1
export XSECURELOCK_AUTH_BACKGROUND_COLOR="#821159"
export XSECURELOCK_AUTH_CURSOR_BLINK=0

# start xss-lock
xss-lock -- xsecurelock&

# set X11 keybinds -- ~/.xbindkeysrc -- multimedia & shortcuts
xbindkeys

# touchpad settings -- /etc/X11/xorg.conf.d/90-touchpad.conf

# set wallpaper
feh --bg-scale ~/Media/Wallpapers/purple_warp.png

# set nightlight
redshift -O 3500

# start compositor -- /etc/xdg/picom.conf
picom&

# set bar
slstatus &

# start WM
exec dwm

# SHELL ALIASES
# alias cmatrix="cmatrix -C yellow -u 9"
# alias rm="rm -i"
# alias open="xdg-open"
# alias li="tree -L 2"
# alias sc="sc-im"
