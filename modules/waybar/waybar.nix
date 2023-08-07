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
          #margin = "0";
          layer = "top";
          position = "top";
          modules-left = [ "custom/nix" "wlr/workspaces" ];
          modules-center = [ "wlr/taskbar" ];
          modules-right = [
            "mpris"
            "pulseaudio"
            "network"
            # "bluetooth"
            # "network#speed"
            # "cpu"
            # "temperature"
            "backlight"
            "battery"
            "clock"
            "custom/notification"
            "tray"
          ];

          "hyprland/window" = { };

          persistent_workspaces = {
            # "1" = [ ];
            # "2" = [ ];
            # "3" = [ ];
            # "4" = [ ];
            # "5" = [ ];
            # "6" = [ ];
            # "7" = [ ];
            # "8" = [ ];
            # "9" = [ ];
            "*" = 9;
          };

          "wlr/workspaces" = {
            format = "{icon}";
            on-click = "activate";
            sort-by-number = true;
            format-icons = {
              # "1" = ''<span foreground="#A1EFD3"></span>'';
              # "2" = ''<span foreground="#FFE6B3">󰈹</span>'';
              # "3" = ''<span foreground="#91DDFF">󰒱</span>'';
              # "4" = ''<span foreground="#D4BFFF">󰧑</span>'';
              "1" = "一";
              "2" = "二";
              "3" = "三";
              "4" = "四";
              "5" = "五";
              "6" = "六";
              "7" = "七";
              "8" = "八";
              "9" = "九";
              # "focused" = "";
              # "default" = "";
            };
            # rotate = 90;
          };

          mpris = {
            format =
              "{status_icon}<span weight='bold'>{artist}</span> | {title}";
            status-icons = {
              playing = "<span foreground='#A1EFD3'>󰎈</span> ";
              paused = "<span foreground='#FFE6B3'>󰏤</span> ";
              stopped = "<span foreground='#F48FB1'>󰓛</span> ";
            };
            max-length = 50;
          };

          "custom/nix" = { format = " 󱄅 "; };

          "wlr/taskbar" = {
            on-click = "activate";
            # rotoate = 90;
          };

          "pulseaudio" = {
            # format = "<span foreground='#F48FB1'>󰓃</span> {volume}%";
            "format" = "{icon}  {volume}%";
            "format-bluetooth" = "{icon}  {volume}%";
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
            "on-click" = "pavucontrol";
            #"rotate" = 90;
          };

          "network" = {
            # "format-wifi" = "{essid} ({signalStrength}%) ";
            "format-wifi" = "{essid}  ";
            "format-ethernet" = "";
            "format-disconnected" = "";
            "tooltip-format" = "{ipaddr}/{cidr} via {gwaddr} ";
            "on-click" = "alacritty -e 'nmtui'";
            # "rotate" = 90;
            "max-length" = 50;
          };

          # "network#interface" = {
          #   format-ethernet = "<span foreground='#91DDFF'>󰣶 </span> {ifname}";
          #   format-wifi = "<span foreground='#91DDFF'>󰖩 </span>{ifname}";
          #   tooltip = true;
          #   tooltip-format = "{ipaddr}";
          # };

          # "network#speed" = {
          #   format =
          #     "<span foreground='#78A8FF'>⇡</span>{bandwidthUpBits} <span foreground='#78A8FF'>⇣</span>{bandwidthDownBits}";
          # };

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
            format = "<span foreground='#F2B482'>{icon} </span>{percent}%";
            format-icons = [ "󰃜" "󰃛" "󰃚 " ];
            #rotate = 90;
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
            "format" = "{icon}  {capacity}%";
            "format-charging" = "  {capacity}%";
            "format-good" =
              "{icon}  {capacity}%"; # An empty format will hide the module
            "format-full" = "{icon}  {capacity}%";
            "format-icons" = [ "" "" "" "" "" ];
            #"rotate" = 90;
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
            #"rotate" = 90;
          };

          clock = {
            format = "<span foreground='#A1EFD3'> </span>{:%H:%M}";
            format-alt = "<span foreground='#A1EFD3'󰃭  </span>{:%Y-%m-%d}";
            #rotate = 90;
          };

          "custom/notification" = {
            exec = "~/.config/waybar/scripts/dunst.sh";
            tooltip = false;
            on-click = "dunstctl set-paused toggle";
            restart-interval = 1;
            #rotate = 90;
          };

          tray = {
            icon-size = 16;
            spacing = 10;
          };
        };
      };

      style = ''
        /* Styles */

        /* Colors (gruvbox) */
        @define-color black	#282828;
        @define-color red	#cc241d;
        @define-color green	#98971a;
        @define-color yellow	#d79921;
        @define-color blue	#458588;
        @define-color purple	#b16286;
        @define-color aqua	#689d6a;
        @define-color gray	#a89984;
        @define-color brgray	#928374;
        @define-color brred	#fb4934;
        @define-color brgreen	#b8bb26;
        @define-color bryellow	#fabd2f;
        @define-color brblue	#83a598;
        @define-color brpurple	#d3869b;
        @define-color braqua	#8ec07c;
        @define-color white	#ebdbb2;
        @define-color bg2	#504945;


        @define-color warning 	@bryellow;
        @define-color critical	@red;
        @define-color mode	@black;
        @define-color unfocused	@bg2;
        @define-color focused	@braqua;
        @define-color inactive	@purple;
        @define-color sound	@brpurple;
        @define-color network	@purple;
        @define-color memory	@braqua;
        @define-color cpu	@green;
        @define-color temp	@brgreen;
        @define-color layout	@bryellow;
        @define-color battery	@aqua;
        @define-color date	@black;
        @define-color time	@white;
        @define-color music @aqua;
        @define-color notification  @aqua;

        /* Reset all styles */
        * {
          border: none;
          border-radius: 14px;
          min-height: 0;
          box-shadow: none;
          text-shadow: none;
          icon-shadow: none;
        }

        window {
          margin: 10px 0px 0px 0px;
          padding: 0px 0px 0px 0px;
        }

        window#waybar {
         background-color : transparent;
         font-family: 'FiraCode Mono';
         font-size: 14px;
         margin: 0px 0px 0px 0px;
         }

        .modules-left * {
          background-color: @black;
          margin: 0px 2px 0px 2px;
        }

        .modules-center * {
          background-color: @black;
          margin: 0px 4px 0px 4px;
        }

        .modules-right * {
          background-color: @black;
          margin: 4px 0px 4px 0px;
        }

        #workspaces button {
          background-color: @black;
          color: @text;
          padding: 0px 0px;
        }

        #workspaces button.active {
          background-color: @bg2;
          color: @text;
        }

        tooltip {
          background-color: @bg2;
          color: @white;
        }

        #clock,
        #battery,
        #backlight,
        #network,
        #pulseaudio,
        #mpris,
        #custom-media,
        #tray,
        #mode,
        #taskbar,
        #custom-nix
        #idle_inhibitor {
            padding: 0 0px;
            margin: 0px 0px;
        }

        #custom-nix {
          color: @blue;
          background-color: @black;
        }


        #taskbar button {
          background-color: @black;
        }

        #taskbar button.active {
          background-color: @black;
        }

        #mpris {
          background-color: @music;
          color: @text;
        }

        #pulseaudio {
          background-color: @audio;
          color: @text;
        }

        #network {
          background-color: @network;
          color: @text;
        }

        #backlight {
          background-color: @backlight;
          color: @text;
        }

        #custom-notification {
          background-color: @notification;
          color: @text;
        }

        #batttery {
          background-color: @battery;
          color: @text;
        }

        #clock {
          background-color: @clock;
          color: @text;
          }

        #tray {
          /* background-color: @bg2; */
        }

        /* #tray * {
          padding: 0;
          margin: 0;
        } */

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
