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
          modules-left = [ "custom/nix" "wlr/workspaces" "mpris" ];
          modules-center = [ "wlr/taskbar" ];
          modules-right = [
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
              playing = " 󰎈 ";
              paused = " 󰏤 ";
              stopped = " 󰓛 ";
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
            "format-wifi" = "{essid}   ";
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

          cpu = { format = "  {usage}% 󱐌 {avg_frequency}"; };

          temperature = {
            format = "{icon} {temperatureC} °C";
            format-icons = [ "" "" "" "󰈸" ];
          };

          backlight = {
            format = "{icon} {percent}%";
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
            "format" = " {icon}  {capacity}%";
            "format-charging" = "   {capacity}%";
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
            format = "  {:%H:%M}";
            format-alt = " 󰃭 {:%Y-%m-%d}";
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
        @define-color orange  #d65d0e;
        @define-color red	#cc241d;
        @define-color green	#98971a;
        @define-color yellow	#d79921;
        @define-color blue	#458588;
        @define-color purple	#b16286;
        @define-color aqua	#689d6a;
        @define-color gray	#a89984;
        @define-color brorange  #fe8019;
        @define-color brgray	#928374;
        @define-color brred	#fb4934;
        @define-color brgreen	#b8bb26;
        @define-color bryellow	#fabd2f;
        @define-color brblue	#83a598;
        @define-color brpurple	#d3869b;
        @define-color braqua	#8ec07c;
        @define-color white	#ebdbb2;
        @define-color bg2	#504945;


        @define-color bg            @black;
        @define-color warning       @bryellow;
        @define-color critical      @red;
        @define-color mode          @black;
        @define-color unfocused     @bg2;
        @define-color focused       @braqua;
        @define-color inactive      @purple;
        @define-color audio         @blue;
        @define-color network       @green;
        @define-color layout        @bryellow;
        @define-color battery       @yellow;
        @define-color date          @yellow;
        @define-color time          @orange;
        @define-color music         @aqua;
        @define-color notification  @red;
        @define-color backlight     @aqua;

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
          margin: 0px 0px 0px 0px;
          padding: 0px 0px 0px 0px;
        }

        window#waybar {
          background-color : transparent;
          font-family: 'FiraCode Mono';
          font-size: 14px;
          margin: 0px 0px 0px 0px;
        }

        .modules-left * {
          background-color: @bg;
          margin: 0px 4px 0px 4px;
        }

        .modules-center * {
          background-color: @bg;
          margin: 0px 2px 0px 2px;
        }

        .modules-right * {
          background-color: @bg;
          margin: 0px 4px 0px -20px;
          padding: 0px 24px 0px 8px;
        }

        #workspaces button {
          background-color: @bg;
          color: @white;
          padding: 0px 0px;
        }

        #workspaces button.active {
          background-color: @bg;
          color: @orange;
        }

        tooltip {
          background-color: @bg;
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
          /*padding: 0 0px;
          margin: 0px 0px;*/
        }

        #custom-nix {
          color: @blue;
          background-color: @bg;
          padding: 0px 2px 0px 4px;
        }

        #taskbar button {
          background-color: @bg;
        }

        #taskbar button.active {
          background-color: @bg2;
        }

        #mpris {
          background-color: @bg;
          color: @music;
          padding: 0px 10px 0px 10px;
        }

        #pulseaudio {
          background-color: @bg;
          color: @audio;
        }

        #network {
          background-color: @bg;
          color: @network;
          /*padding: 0px 16px 0px 16px;*/
        }

        #backlight {
          background-color: @bg;
          color: @backlight;
          /*padding: 0px 8px 0px 8px;*/
        }

        #custom-notification {
          background-color: @bg;
          color: @notification;
        }

        #battery {
          background-color: @bg;
          color: @battery;
          /*padding: 0px 16px 0px 16px;*/
        }

        #clock {
          background-color: @bg;
          color: @clock;
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
