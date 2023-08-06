{ inputs, config, lib, pkgs, ... }:

{
  home-manager.users.phonon = { pkgs, ... }: {
    home.stateVersion = "23.05";
    home.homeDirectory = "/home/phonon";

    home.packages = with pkgs; [ eww-wayland lua pamixer brightnessctl ];

    # programs.eww.enable = true;

    # Config
    home.file.".config/eww/eww.scss" = {
      source = ./eww.scss;
      target = .config/eww/eww.scss;
    };

    home.file.".config/eww/eww.yuck" = {
      source = ./eww.yuck;
      target = .config/eww/eww.scss;
    };

    #scripts
    home.file.".config/eww/scripts/battery.sh" = {
      source = ./scripts/battery.sh;
      executable = true;
    };

    home.file.".config/eww/scripts/wifi.sh" = {
      source = ./scripts/wifi.sh;
      executable = true;
    };

    home.file.".config/eww/scripts/brightness.sh" = {
      source = ./scripts/brightness.sh;
      executable = true;
    };

    home.file.".config/eww/scripts/workspaces.sh" = {
      source = ./scripts/workspaces.sh;
      executable = true;
    };

    home.file.".config/eww/scripts/workspaces.lua" = {
      source = ./scripts/workspaces.lua;
      executable = true;
    };
  };
}
