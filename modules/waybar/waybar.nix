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
          position = "top";
          # width = 14;
          # height = 1080;
          modules-left = [ "custom/nix" "wlr/workspaces" ];
          modules-center = [ "wlr/taskbar" ];
          modules-right = [
            "mpris"
            "pulseaudio"
            "network"
            "bluetooth"
            # "network#speed"
            # "cpu"
            # "temperature"
            "backlight"
            "battery"
            "clock"
            "custom/notification"
            "tray"
          ];

          "hyprland/window" = {
            #   max-length = 150;
            # "rotate" = 90;
          };

          persistent_workspaces = {
            "1" = [ ];
            "2" = [ ];
            "3" = [ ];
            "4" = [ ];
            "5" = [ ];
            "6" = [ ];
            "7" = [ ];
            "8" = [ ];
            "9" = [ ];
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
          };

          "custom/nix" = { format = "󱄅 "; };

          "wlr/taskbar" = {
            on-click = "activate";
            # rotoate = 90;
          };

          "pulseaudio" = {
            # format = "<span foreground='#F48FB1'>󰓃</span> {volume}%";
            "format" = ''
              {icon}
              {volume}%'';
            "format-bluetooth" = "{icon}{volume}%";
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
            "format-wifi" = "{essid} ({signalStrength}%) ";
            "format-ethernet" = "";
            "format-disconnected" = "";
            "tooltip-format" = "{ipaddr}/{cidr} via {gwaddr} ";
            "on-click" = "alacritty -e 'nmtui'";
            # "rotate" = 90;
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
            format = "<span foreground='#F2B482'>{icon}</span>{percent}%";
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
            "format" = "{icon}{capacity}%";
            "format-charging" = "{capacity}%";
            "format-good" =
              "{icon}{capacity}%"; # An empty format will hide the module
            "format-full" = "{icon}{capacity}%";
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
            format = "<span foreground='#A1EFD3'></span>{:%H:%M}";
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
            spacing = 8;
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
        	border-radius: 0;
        	min-height: 0;
        	margin: 0;
        	padding: 0;
        	box-shadow: none;
        	text-shadow: none;
        	icon-shadow: none;
        }

        window#waybar {
         background-color : transparent;
         /* border-bottom: solid 2px @white; */
         font-family: 'FiraCode Mono';
         font-size: 14px;
         }

        tooltip {
          background-color: @bg2;
          color: @white;
        }

        #custom-nix {
          color: @blue;
          background-color: @black;
          padding: 2px 8px;
        }

        #workspaces button {
          padding: 2px 8px;
          margin: 0 0 0 0;
          background-color: @black;
        }

        #workspaces button.active {
          background-color: @bg2;
        }

        #taskbar button {
          background-color: @black;
          padding: 2px 8px;
        }

        #taskbar button.active {
          background-color: @black;
          padding: 2px 8px;
        }

        .modules-right * {
          background-color: @black;
          padding: 0px 8px;
          margin: 0 0 0 4px;
        }

        #mpris {
          background-color: @black;
          padding: 0 8px;
          color: @music;
        }

        #custom-notification {
          padding: 0 8px 0 8px;
          background-color: @black;
          color: @notification;
        }

        #tray {
          background-color: @brred;
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
