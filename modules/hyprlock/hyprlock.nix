{ config, lib, pkgs, nixpkgs-unstable, inputs, ... }:

# let unstable = import inputs.nixpkgs-unstable { system = mySystem; };
let unstable = import inputs.nixpkgs-unstable { system = "x86_64-linux"; };
in {
  environment.systemPackages = with pkgs; [ unstable.hyprlock ];

  home-manager.users.phonon = { pkgs, ... }: {
    home.stateVersion = "22.11";

    home.file.".config/hypr/hyprlock.conf".text = let
      wallpaper-laptop =
        /home/phonon/Pictures/Wallpapers/gruv/houseonthesideofalake.jpg;
    in ''
            general {
              hide_cursor = true
            }

            background {
                monitor =
                path = ${wallpaper-laptop}
                color = rgba(282828ff)

                # all these options are taken from hyprland, see https://wiki.hyprland.org/Configuring/Variables/#blur for explanations
                blur_passes = 0 # 0 disables blurring
                blur_size = 7
                noise = 0.0117
                contrast = 0.8916
                brightness = 0.8172
                vibrancy = 0.1696
                vibrancy_darkness = 0.0
            }

            background {
                monitor = eDP-1
                path = ${wallpaper-laptop}
                color = rgba(282828ff)

                # all these options are taken from hyprland, see https://wiki.hyprland.org/Configuring/Variables/#blur for explanations
                blur_passes = 0 # 0 disables blurring
                blur_size = 7
                noise = 0.0117
                contrast = 0.8916
                brightness = 0.8172
                vibrancy = 0.1696
                vibrancy_darkness = 0.0
            }

            input-field {
                monitor =
                size = 250, 50
                outline_thickness = 3
                dots_size = 0.2 # Scale of input-field height, 0.2 - 0.8
                dots_spacing = 1.0 # Scale of dots' absolute size, 0.0 - 1.0
                dots_center = true
                dots_rounding = -1 # -1 default circle, -2 follow input-field rounding
                outer_color = rgb(282828)
                inner_color = rgb(282828)
                font_color = rgb(83a598)
                fade_on_empty = false
                fade_timeout = 1000 # Milliseconds before fade_on_empty is triggered.
                placeholder_text = <b>...</b> # Text rendered in the input box when it's empty.
                hide_input = false
                rounding = -1 # -1 means complete rounding (circle/oval)
                check_color = rgb(d79921)
                fail_color = rgb(cc241d) # if authentication failed, changes outer_color and fail message color
                fail_text = <i>$FAIL <b>($ATTEMPTS)</b></i> # can be set to empty
                fail_transition = 300 # transition time in ms between normal outer_color and fail_color
                capslock_color = -1
                numlock_color = -1
                bothlock_color = -1 # when both locks are active. -1 means don't change outer color (same for above)
                invert_numlock = false # change color if numlock is off
                swap_font_color = false # see below

                position = 0, 100
                halign = center
                valign = bottom
            }

            # label {
            #     monitor =
            #     text = $TIME
            #     text_align = center # center/right or any value for default left. multi-line text alignment inside label container
            #     color = rgba(ebdbb2ff)
            #     font_size = 128
            #     font_family = Fira Code
            #     rotate = 0 # degrees, counter-clockwise

            #     position = 0, 60
            #     halign = center
            #     valign = center
            # }

      label {
          monitor =
          text = cmd[update:1000] echo "<b><big> $(date +"%H:%M") </big></b>"
          color = rgb(fbf1c7)
          font_size = 128
          font_family = Fira Code
          position = 0, 20
          halign = center
          valign = center
      }
      label {
          monitor =
          text = cmd[update:1000] LC_TIME=en_US.UTF-8 echo "<b><big> $(date +"%A %d %b") </big></b>"
          color = rgb(83a598)
          font_size = 16
          font_family = Fira Code
          position = 0, -60
          halign = center
          valign = center
      }
    '';
  };
}
