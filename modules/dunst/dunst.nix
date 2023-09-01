{ config, lib, pkgs, ... }:

{
  home-manager.users.phonon = { pkgs, ... }: {
    home.stateVersion = "23.05";

    services.dunst = {
      enable = true;
      settings = {
        global = {
          frame_color = "#A89984";
          separator_color = "frame";
          font = "Fira Code";
        };

        urgency_low = {
          background = "#32302F";
          foreground = "#EBDBB2";
        };

        urgency_normal = {
          background = "#32302F";
          foreground = "#EBDBB2";
        };

        urgency_critical = {
          background = "#32302F";
          foreground = "#EBDBB2";
          frame_color = "#FB4934";
        };
      };
    };
  };
}
