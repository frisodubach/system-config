{ pkgs, inputs, lib, ... }:

{

  home-manager.users.phonon = { pkgs, ... }: {
    home.stateVersion = "23.05";
    # home.packages = [ pkgs.inter ];

    services.playerctld.enable = true;

    programs.waybar = {
      enable = true;
      package = inputs.hyprland.packages.${pkgs.system}.waybar-hyprland;
      # package = pkgs.waybar.overrideAttrs (oldAttrs: { mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true"] ;} );
      settings = {
        mainBar = {
          margin = "0";
          layer = "top";
          postion = "right";
          modules-left = [ "custom/nix" "wlr/workspaces" "mpris" ];
          modules-center = [ "wlr/taskbar" ];
          modules-right = [
            "pulseaudio"
            "network#interface"
            "bluetooth"
            # "network#speed"
            # "cpu"
            "temperature"
            "backlight"
            "battery"
            "clock"
            "custom/notification"
            "tray"
          ];

          persistent_workspaces = {
            "1" = [ ];
            "2" = [ ];
            "3" = [ ];
          };

          "wlr/workspaces" = {
            format = "{icon}";
            on-click = "activate";
            sort-by-number = true;
            format-icons = {
              "1" = ''<span foreground="#A1EFD3"></span>'';
              "2" = ''<span foreground="#FFE6B3">󰈹</span>'';
              "3" = ''<span foreground="#91DDFF">󰒱</span>'';
              "4" = ''<span foreground="#D4BFFF">󰧑</span>'';
              "focused" = "";
              "default" = "";
            };
          };

          mpris = {
            format =
              "{status_icon}<span weight='bold'>{artist}</span> | {title}";
            status-icons = {
              playing = "<span foreground='#A1EFD3'>󰎈</span> ";
              paused = "<span foreground='#FFE6B3'>󰏤</span> ";
              stopped = "<span foreground='#F48FB1'>󰓛</span> ";
            };
          };

          "custom/nix" = { format = "󱄅 "; };

          "wlr/taskbar" = { on-click = "activate"; };

          "pulseaudio" = {
            # format = "<span foreground='#F48FB1'>󰓃</span> {volume}%";
            "format" = "{volume}% {icon}";
            "format-bluetooth" = "{volume}% {icon}";
            "format-muted" = "";
            "format-icons" = {
              "headphone" = "";
              "hands-free" = "";
              "headset" = "";
              "phone" = "";
              "portable" = "";
              "car" = "";
              "default" = [ "" "" ];
            };
            "scroll-step" = 1;
          };

          "network#interface" = {
            format-ethernet = "<span foreground='#91DDFF'>󰣶 </span> {ifname}";
            format-wifi = "<span foreground='#91DDFF'>󰖩 </span>{ifname}";
            tooltip = true;
            tooltip-format = "{ipaddr}";
          };

          "network#speed" = {
            format =
              "<span foreground='#78A8FF'>⇡</span>{bandwidthUpBits} <span foreground='#78A8FF'>⇣</span>{bandwidthDownBits}";
          };

          cpu = {
            format =
              "<span foreground='#D4BFFF'>  </span>{usage}% <span foreground='#D4BFFF'>󱐌 </span>{avg_frequency}";
          };

          temperature = {
            format =
              "<span foreground='#FFE6B3'>{icon} </span>{temperatureC} °C";
            format-icons = [ "" "" "" "󰈸" ];
          };

          backlight = {
            format = "<span foreground='#F2B482'>{icon}</span> {percent}%";
            format-icons = [ "󰃜" "󰃛" "󰃚 " ];
          };

          # battery = {
          #   format-critical =
          #     "<span foreground='#100E23' background='#F48FB1'>{icon} {capacity}%</span>";
          #   format = "<span foreground='#F48FB1'>{icon}</span> {capacity}%";
          #   format-icons = [ "󰁺" "󰁾" "󰂀" "󱟢" ];
          # };
          "battery" = {
            "states" = {
              "good" = 95;
              "warning" = 30;
              "critical" = 15;
            };
            "format" = "{capacity}% {icon}";
            "format-charging" = "{capacity}% ";
            "format-good" =
              "{capacity}% {icon}"; # An empty format will hide the module
            "format-full" = "{capacity}% {icon}";
            "format-icons" = [ "" "" "" "" "" ];
          };

          "bluetooth" = {
            # "controller": "controller1", // specify the alias of the controller if there are more than 1 on the system
            "format" = " {status}";
            "format-disabled" = ""; # an empty format will hide the module
            "format-connected" = " {num_connections}";
            "tooltip-format" = "{controller_alias}	{controller_address}";
            "tooltip-format-connected" = ''
              {controller_alias}	{controller_address}

              {device_enumerate}'';
            "tooltip-format-enumerate-connected" =
              "{device_alias}	{device_address}";
          };

          clock = {
            format = "<span foreground='#A1EFD3'>  </span>{:%H:%M}";
            format-alt = "<span foreground='#A1EFD3'󰃭  </span>{:%Y-%m-%d}";
          };

          "custom/notification" = {
            exec = "~/.config/waybar/scripts/dunst.sh";
            tooltip = false;
            on-click = "dunstctl set-paused toggle";
            restart-interval = 1;
          };

          tray = {
            icon-size = 16;
            spacing = 8;
          };
        };
      };

      style = ''
        * {
          min-height: 0;
          color: #CBE3E7;
        }

        window#waybar {
          border-bottom: solid 2px #2D2B40;
          font-family: 'FiraCode Mono';
          font-size: 14px;
        }

        tooltip {
          background-color: #2D2B40;
          color: #CBE3E7;
        }

        #custom-nix {
          color: #91DDFF;
          padding: 2px 8px;
        }

        #workspaces button {
          padding: 2px 8px;
          margin: 0 8px 0 0;
        }

        #workspaces button.active {
          background-color: #2D2B40;
        }

        #taskbar button.active {
          background-color: #2D2B40;
        }

        .modules-right * {
          padding: 0 8px;
          margin: 0 0 0 4px;
        }

        #mpris {
          background-color: #2D2B40;
          padding: 0 8px;
          color: #8A889D;
        }

        #custom-notification {
          padding: 0 8px 0 8px;
          background-color: #2D2B40;
          color: #100E23;
        }

        #tray {
          background-color: #2D2B40;
          padding: 0 8px 0 8px;
        }

        #tray * {
          padding: 0;
          margin: 0;
        }
      '';
    };

    home.file.".config/waybar/scripts/dunst.sh" = {
      text = ''
        COUNT=$(dunstctl count waiting)
        ENABLED="󰂚 "
        DISABLED="󰂛 "
        if [ $COUNT != 0 ]; then DISABLED="󱅫 "; fi
        if dunstctl is-paused | grep -q "false"; then
          echo "<span foreground='#A1EFD3'>$ENABLED</span>"
        else
          echo "<span foreground='#F48FB1'>$DISABLED</span>"
        fi
      '';
      executable = true;
    };
  };
}