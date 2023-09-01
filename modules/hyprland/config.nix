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
  exec-once=swaybg -i /home/phonon/Pictures/Wallpapers/wallhavenGruvbox/leaves3.jpg
  #exec-once=wlsunset -l -23 -L -46
  exec-once=eww daemon
  exec-once=eww open bar
  # exec-once=waybar
  # exec-once=dunst
  exec-once=mako
  exec-once = swayidle -w timeout 300 'gtklock' before-sleep 'gtklock' &
  exec-once = swayidle -w timeout 450 'systemctl suspend' &
  # exec-once = swayidle -w timeout 300 'systemctl suspend' before-sleep 'gtklock' &
  exec-once = swayosd-server

  # Source a file (multi-file configs)
  # source = ~/.config/hypr/myColors.conf

  # Some default env vars.
  env = XCURSOR_SIZE,24

  # For all categories, see https://wiki.hyprland.org/Configuring/Variables/
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
      col.active_border = 0xffebdbb2
      col.inactive_border = 0xff282828
      resize_on_border = true
      hover_icon_on_border = true

      layout = dwindle
  }

  decoration {
      # See https://wiki.hyprland.org/Configuring/Variables/ for more

      rounding = 10
      blur = true
      blur_size = 3
      blur_passes = 1
      blur_new_optimizations = true

      drop_shadow = true
      shadow_range = 4
      shadow_render_power = 3
      col.shadow = rgba(01010166)
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

  master {
      # See https://wiki.hyprland.org/Configuring/Master-Layout/ for more
      new_is_master = true
  }

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
  # windowrule = float, ^(kitty)$
  # Example windowrule v2
  # windowrulev2 = float,class:^(kitty)$,title:^(kitty)$
  # See https://wiki.hyprland.org/Configuring/Window-Rules/ for more
  windowrule=float,title:^(Open File)(.*)$
  windowrule=float,title:^(Open Folder)(.*)$
  windowrule=float,title:^(Save As)(.*)$
  windowrule=float,title:^(Library)(.*)$
  windowrule=float,title:^(Select a File)(.*)$
  windowrule=float,title:^(Choose wallpaper)(.*)$
  windowrule=workspace 1,Emacs
  windowrule=workspace 2,librewolf
  windowrule=workspace 3,alacritty
  windowrule=workspace 3,Nautilus
  windowrule=workspace 4,Signal


  # See https://wiki.hyprland.org/Configuring/Keywords/ for more
  $mainMod = SUPER

  # Example binds, see https://wiki.hyprland.org/Configuring/Binds/ for more
  bind = $mainMod, Q, exec, alacritty
  bind = $mainMod, C, killactive,
  # bind = $mainMod, M, exit,
  bind = $mainMod, E, exec, nautilus
  bind = $mainMod, F, togglefloating,
  bind = $mainMod, space, exec, wofi --show drun -O -Q -M fuzzy -i
  bind = $mainMod, P, pseudo, # dwindle
  bind = $mainMod, S, togglesplit, # dwindle
  bind = $mainMod, N, exec, emacsclient -nc
  bind = $mainMod, B, exec, librewolf

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
  bind=,XF86MonBrightnessUp,exec,brightnessctl set +5%
  bind=,XF86MonBrightnessDown,exec,brightnessctl set 5%-

  # Audio control
  bind = ,XF86AudioMute, exec, pamixer -t
  bind=,XF86AudioRaiseVolume,exec,pamixer -i 5
  bind=,XF86AudioLowerVolume,exec,pamixer -d 5

  # Control audio playback with hardware playback keys
  bind=, XF86AudioPlay, exec, playerctl play-pause
  bind=, XF86AudioPause, exec, playerctl play-pause
  bind=, XF86AudioNext, exec, playerctl next
  bind=, XF86AudioPrev, exec, playerctl previous

  # $screenLockCmd = swaylock --clock --indicator --screenshots --effect-scale 0.4 --effect-vignette 0.2:0.5 --effect-blur 4x2 --datestr "%a %e.%m.%Y" --timestr "%k:%M"
  $screenLockCmd = gtklock
  $suspendCmd = systemctl suspend
  $lockAndSuspendCmd = $screenLockCmd & sleep 1; $suspendCmd &

  # On lid close, lock screen and suspend
  # bindl = , switch:on:Lid Switch, exec, $lockAndSuspendCmd

  # Keybind to lock screen
  # bind = $mainMod, L, exec, $screenLockCmd

  # Keybind to lock screen and suspend
  bind = $mainMod, M, exec, $lockAndSuspendCmd

  # Keybind to turn off
  bind=, XF86PowerOff, exec, systemctl suspend

''
