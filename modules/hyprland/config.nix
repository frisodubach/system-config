{ ... }:

''
  # This is an example Hyprland config file.
  #
  # Refer to the wiki for more information.

  #
  # Please note not all available settings / options are set here.
  # For a full list, see the wiki
  #

  # See https://wiki.hyprland.org/Configuring/Monitors/
  # monitor=,preferred,auto,auto
  # monitor=,highres,auto,1
  #monitor=eDP-1,1920x1080@60,0x0,1
  # monitor=eDP-1,addreserved,0,0,48,0
  # monitor=DP-1,preferred,auto,1,mirror,eDP-1
  monitor=eDP-1,1920x1080@60,1920x0,1
  monitor=DP-1,1920x1080@60,0x0,1
  monitor=,highres,auto,1

  # See https://wiki.hyprland.org/Configuring/Keywords/ for more

  # Execute your favorite apps at launch
  exec-once=hyprctl setcursor \'Capitaine Cursors \(Gruvbox\)\' 24
  exec-once=swaybg -m fill -i /home/phonon/Pictures/Wallpapers/gruv/stairs.jpg
  exec-once=eww daemon
  exec-once=eww open bar
  exec-once=mako
  exec-once = hypridle
  # exec-once = swayidle -w timeout 300 'systemctl suspend' before-sleep 'swaylock' &
  # exec-once = swayidle -w timeout 450 'systemctl suspend' &
  # exec-once=swayidle -w timeout 300 'hyprctl dispatch dpms off' timeout 360 'swaylock' resume 'hyprctl dispatch dpms on' before-sleep 'swaylock' &
  exec-once = swayosd-server
  exec-once = wl-paste --type text --watch cliphist store #Stores only text data
  exec-once = wl-paste --type image --watch cliphist store #Stores only image data

  # Fix for env variables
  exec-once=dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP

  # Source a file (multi-file configs)
  # source = ~/.config/hypr/myColors.conf

  # Some default env vars.
  env = XCURSOR_SIZE,24

  # For all categories, see https://wiki.hyprland.org/Configuring/Variables/
  misc {
       vfr = true
       enable_swallow = true
  }

  input {
      kb_layout = us
      # kb_variant =
      # kb_model =
      # kb_options =
      # kb_rules =

      follow_mouse = 2
      accel_profile = flat

      touchpad {
          natural_scroll = true
          disable_while_typing = true
          clickfinger_behavior = false
          tap-to-click = true
          scroll_factor = 0.6

      }

      sensitivity = 0.5 # -1.0 - 1.0, 0 means no modification.
  }

  general {
      # See https://wiki.hyprland.org/Configuring/Variables/ for more

      gaps_in = 5
      gaps_out = 16
      border_size = 2
      col.active_border = 0xff665C54
      col.inactive_border = 0xff282828
      resize_on_border = true
      hover_icon_on_border = true

      layout = dwindle
  }

  decoration {
      # See https://wiki.hyprland.org/Configuring/Variables/ for more

      rounding = 10
      drop_shadow = false
      shadow_range = 4
      shadow_render_power = 3
      col.shadow = rgba(01010166)

      blur {
      enabled = false
      size = 3
      passes = 1
      new_optimizations = true
      }

  }

  animations {
      enabled = false

      # Some default animations, see https://wiki.hyprland.org/Configuring/Animations/ for more

      bezier = myBezier, 0.05, 0.9, 0.1, 1.05

      animation = windows, 1, 7, myBezier
      animation = windowsOut, 1, 7, default, popin 80%
      animation = border, 1, 10, default
      animation = borderangle, 1, 8, default
      animation = fade, 1, 7, default
      animation = workspaces, 1, 6, default
  }

  dwindle {
      # See https://wiki.hyprland.org/Configuring/Dwindle-Layout/ for more
      pseudotile = true # master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
      preserve_split = true # you probably want this
  }

  #master {
      # See https://wiki.hyprland.org/Configuring/Master-Layout/ for more
      # new_is_master = true
  #}

  gestures {
      # See https://wiki.hyprland.org/Configuring/Variables/ for more
      workspace_swipe = true
      workspace_swipe_fingers = 3
  }

  # Example per-device config
  # See https://wiki.hyprland.org/Configuring/Keywords/#per-device-input-configs for more
  # device:epic-mouse-v1 {
  #     sensitivity = -0.5
  # }

  # Example windowrule v1
  windowrule=float,title:^(Open File)(.*)$
  windowrule=float,title:^(Open Folder)(.*)$
  windowrule=float,title:^(Save As)(.*)$
  windowrule=float,title:^(Library)(.*)$
  windowrule=float,title:^(Select a File)(.*)$
  windowrule=float,title:^(Choose wallpaper)(.*)$
  windowrule=float,title:^(Open Image)(.*)$ # GIMP
  # windowrule=workspace 1,Emacs
  # windowrule=workspace 2,librewolf
  # windowrule=workspace 3,alacritty
  # windowrule=workspace 3,Nautilus
  # windowrule=workspace 4,Signal


  # See https://wiki.hyprland.org/Configuring/Keywords/ for more
  $mainMod = SUPER

  # Application laucnhing
  bind = $mainMod, Q, exec, kitty
  bind = $mainMod, T, exec, emacsclient -nc --eval "(+vterm/here t)"
  bind = $mainMod, E, exec, kitty -e yazi #Need to run w/ a terminal
  bind = $mainMod, space, exec, rofi -show drun
  bind = $mainMod SHIFT, space, exec, rofi -show run
  bind = $mainMod, P, exec, pidof bitwarden && hyprctl dispatch focuswindow bitwarden || bitwarden
  bind = $mainMod, N, exec, emacsclient -nc
  bind = $mainMod, B, exec, pidof librewolf && hyprctl dispatch focuswindow librewolf || librewolf
  bind = $mainMod SHIFT, B, exec, rofi-bluetooth
  bind = $mainMod, I, exec, vimiv
  bind = $mainMod, V, exec, rofi-mullvad
  bind = $mainMod, M, exec, mullvad-browser
  bind = $mainMod SHIFT, M, exec, pidof signal-desktop && hyprctl dispatch focuswindow Signal || signal-desktop
  bind = $mainMod, A, exec, rhythmbox

  # Manage windows/workspaces
  bind = $mainMod, S, swapactiveworkspaces, 0 1 # swap workspace between monitors
  bind = $mainMod SHIFT, P, pseudo, # dwindle
  bind = $mainMod, W, togglesplit, # dwindle
  bind = $mainMod, F, togglefloating,
  bind = $mainMod SHIFT, F, fullscreen,
  bind = $mainMod, C, killactive,
  bind = $mainMod, Y, togglespecialworkspace, special
  bind = $mainMod SHIFT, Y, movetoworkspace, special

  # Groups
  # bind = $mainMod CTRL, G, togglegroup
  # bind = $mainMod, G, changegroupactive, f
  # bind = $mainMod SHIFT, G, changegroupactive, b
  # bind = $mainMod ALT, G, moveoutofgroup

  # bind = $mainMod CTRL SHIFT, H, moveintogroup, l
  # bind = $mainMod CTRL SHIFT, L, moveintogroup, r
  # bind = $mainMod CTRL SHIFT, K, moveintogroup, u
  # bind = $mainMod CTRL SHIFT, J, moveintogroup, d

  # TODO: Add some way to control direction where window will be placed
  # bind = $mainMod CTRL SHIFT, H, moveoutofgroup
  # bind = $mainMod CTRL SHIFT, L, moveoutofgroup
  # bind = $mainMod CTRL SHIFT, K, moveoutofgroup
  # bind = $mainMod CTRL SHIFT, J, moveoutofgroup

  # Special workspace -- scratchpad
  bind = $mainMod, X, togglespecialworkspace, scratchpad
  bind = $mainMod SHIFT, X, movetoworkspace, special:scratchpad

  # Move focus with mainMod + arrow keys
  bind = $mainMod, H, movefocus, l
  bind = $mainMod, L, movefocus, r
  bind = $mainMod, K, movefocus, u
  bind = $mainMod, J, movefocus, d

  # Move windows with mainMod + shift + arrow keys
  bind = $mainMod SHIFT, H, movewindow, l
  bind = $mainMod SHIFT, L, movewindow, r
  bind = $mainMod SHIFT, K, movewindow, u
  bind = $mainMod SHIFT, J, movewindow, d

  # Resize active window with mainMod + CTRL + hjkl
  binde = $mainMod CTRL, H, resizeactive, -20 0
  binde = $mainMod CTRL, L, resizeactive, 20 0
  binde = $mainMod CTRL, K, resizeactive, 0 -20
  binde = $mainMod CTRL, J, resizeactive, 0 20

  # Switch workspaces with mainMod + [0-9]
  bind = $mainMod, 1, workspace, 1
  bind = $mainMod, 2, workspace, 2
  bind = $mainMod, 3, workspace, 3
  bind = $mainMod, 4, workspace, 4
  bind = $mainMod, 5, workspace, 5
  bind = $mainMod, 6, workspace, 6
  bind = $mainMod, 7, workspace, 7
  bind = $mainMod, 8, workspace, 8
  bind = $mainMod, 9, workspace, 9
  bind = $mainMod, 0, workspace, 10

  # Move active window to a workspace with mainMod + SHIFT + [0-9]
  bind = $mainMod SHIFT, 1, movetoworkspace, 1
  bind = $mainMod SHIFT, 2, movetoworkspace, 2
  bind = $mainMod SHIFT, 3, movetoworkspace, 3
  bind = $mainMod SHIFT, 4, movetoworkspace, 4
  bind = $mainMod SHIFT, 5, movetoworkspace, 5
  bind = $mainMod SHIFT, 6, movetoworkspace, 6
  bind = $mainMod SHIFT, 7, movetoworkspace, 7
  bind = $mainMod SHIFT, 8, movetoworkspace, 8
  bind = $mainMod SHIFT, 9, movetoworkspace, 9
  bind = $mainMod SHIFT, 0, movetoworkspace, 10

  # Scroll through existing workspaces with mainMod + scroll
  bind = $mainMod, mouse_down, workspace, e+1
  bind = $mainMod, mouse_up, workspace, e-1

  # Scroll through existing workspaces with mainMod + alt + h / l
  bind = $mainMod ALT, l, workspace, e+1
  bind = $mainMod ALT, h, workspace, e-1

  # Move/resize windows with mainMod + LMB/RMB and dragging
  bindm = $mainMod, mouse:272, movewindow
  bindm = $mainMod, mouse:273, resizewindow

  # Brightness control
  # SwayOSD brightness broken
  binde=,XF86MonBrightnessUp,exec,swayosd-client --brightness raise 5
  binde=,XF86MonBrightnessDown,exec,swayosd-client --brightness lower 5

  # Audio control
  binde=,XF86AudioMute,exec,swayosd-client --output-volume mute-toggle
  binde=,XF86AudioRaiseVolume,exec,swayosd-client --output-volume raise 5
  binde=,XF86AudioLowerVolume,exec,swayosd-client --output-volume lower 5

  # Control audio playback with hardware playback keys
  bind=, XF86AudioPlay, exec, playerctl play-pause
  bind=, XF86AudioPause, exec, playerctl play-pause
  bind=, XF86AudioNext, exec, playerctl next
  bind=, XF86AudioPrev, exec, playerctl previous

  # Airplane-mode control
  # bind=,XF86RFKill,exec,
  # bind=,XF86RFKill,exec, rfkill block all
  # bind=,XF86RFKill,exec, rfkill unblock all
  # bind=,XF86RFKill,exec, nmcli radio wifi on
  # bind=,XF86RFKill,exec, nmcli radio wifi off
  # bind=,XF86RFKill,exec, nmcli radio all on
  # bind=,XF86RFKill,exec, nmcli radio all off

  # $screenLockCmd = pidof swaylock || swaylock -i /home/phonon/Pictures/Wallpapers/Photography/mist3.jpg
  $screenLockCmd = pidof hyprlock || hyprlock
  $suspendCmd = systemctl suspend
  $lockAndSuspendCmd = $screenLockCmd & sleep 0.25; $suspendCmd &

  # Screenshots
  bind = $mainMod SHIFT, S, exec, grim -g "$(slurp)" - | wl-copy -t image/png
  bind = , Print, exec, grim -g "$(slurp)" - | swappy -f -

  # On lid close, lock screen and suspend
  # bindl = , switch:on:Lid Switch, exec, $lockAndSuspendCmd
  bindl = , switch:on:Lid Switch, exec, $screenLockCmd
  # Laptop lid open / close switch
  bindl=,switch:off:Lid Switch,exec,hyprctl keyword monitor "eDP-1, 1920x1080, 1920x0, 1" & eww open bar &
  bindl=,switch:on:Lid Switch,exec,hyprctl keyword monitor "eDP-1, disable"

  # Keybind to lock screen and suspend
  bind = $mainMod, Z, exec, $lockAndSuspendCmd

  # Keybind to turn off
  bind=, XF86PowerOff, exec, systemctl suspend

  # Temporary fix for locking screen losing focus
  # allow_session_lock_restore = true
  # bindl = SUPER, BackSpace, exec, pkill -SIGUSR1 swaylock && WAYLAND_DISPLAY=wayland-1 swaylock -f

''
