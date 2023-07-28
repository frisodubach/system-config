{ config, lib, pkgs, ... }:

{
  home-manager.users.phonon = { pkgs, ... }: {
    home.stateVersion = "23.05";

    services.dunst = {
      enable = true;
      settings = {
        global = {
          frame_color = "#8AADF4";
          separator_color = "frame";
          font = "iosevka";
        };

        urgency_low = {
          background = "#24273A";
          foreground = "#CAD3F5";
        };

        urgency_normal = {
          background = "#24273A";
          foreground = "#CAD3F5";
        };

        urgency_critical = {
          background = "#24273A";
          foreground = "#CAD3F5";
          frame_color = "#F5A97F";
        };
      };
    };
  };
}
