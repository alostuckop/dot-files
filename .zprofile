if [ "$(tty)" = "/dev/tty1" ] ; then
        export WLR_NO_HARDWARE_CURSORS=1
        export WLR_RENDERER=vulkan
        export XWAYLAND_NO_GLAMOR=1
        export QT_QPA_PLATFORM="wayland;xcb"
        export QT_QPA_PLATFORMTHEME=qt5ct
        export MOZ_ENABLE_WAYLAND=1
        export MOZ_WEBRENDER=1
        export XDG_SESSION_TYPE=wayland
        export XDG_CURRENT_DESKTOP=sway
        exec sway --unsupported-gpu
fi
