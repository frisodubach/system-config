{ config, lib, pkgs, nixpkgs-unstable, inputs, ... }:

# let unstable = import inputs.nixpkgs-unstable { system = mySystem; };
let unstable = import inputs.nixpkgs-unstable { system = "x86_64-linux"; };
in {
  environment.systemPackages = with pkgs; [ unstable.hypridle ];

  home-manager.users.phonon = { pkgs, ... }: {
    home.stateVersion = "22.11";

    home.file.".config/hypr/hypridle.conf".text = ''
      general {
          lock_cmd = pidof hyprlock || hyprlock       # avoid starting multiple hyprlock instances.
          before_sleep_cmd = loginctl lock-session    # lock before suspend.
          after_sleep_cmd = hyprctl dispatch dpms on  # to avoid having to press a key twice to turn on the display.
      }

      listener {
          timeout = 300                                # 2.5min.
          on-timeout = brightnessctl -s set 10         # set monitor backlight to minimum, avoid 0 on OLED monitor.
          on-resume = brightnessctl -r                 # monitor backlight restore.
      }

      listener {
          timeout = 600                                 # 5min
          on-timeout = loginctl lock-session            # lock screen when timeout has passed
      }

      listener {
          timeout = 630                                 # 5.5min
          on-timeout = hyprctl dispatch dpms off        # screen off when timeout has passed
          on-resume = hyprctl dispatch dpms on          # screen on when activity is detected after timeout has fired.
      }

      listener {
          timeout = 1800                                # 30min
          on-timeout = systemctl suspend                # suspend pc
      }
    '';

  };
}
