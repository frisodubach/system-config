{ inputs, config, lib, pkgs, ... }:

{
  home-manager.users.phonon = { pkgs, ... }: {
    home.stateVersion = "23.05";

    home.packages = with pkgs; [ eww-wayland lua pamixer brightnessctl awk ];

    # programs.eww.enable = true;

    # Config
    home.file.".config/eww/eww.scss" = {
      source = ./eww.scss;
      enable = true;
    };

    home.file.".config/eww/eww.yuck" = {
      source = ./eww.yuck;
      enable = true;
    };

    #scripts
    home.file.".config/ewww/scripts" = {
      source = ./scripts;
      executable = true;
      recursive = true;
    };

    # home.file.".config/eww/scripts/battery.sh" = {
    #   source = ./scripts/battery.sh;
    #   executable = true;
    # };

    # home.file.".config/eww/scripts/wifi.sh" = {
    #   source = ./scripts/wifi.sh;
    #   executable = true;
    # };

    # home.file.".config/eww/scripts/brightness.sh" = {
    #   source = ./scripts/brightness.sh;
    #   executable = true;
    # };

    # home.file.".config/eww/scripts/workspaces.sh" = {
    #   source = ./scripts/workspaces.sh;
    #   executable = true;
    # };

    # home.file.".config/eww/scripts/workspaces.lua" = {
    #   source = ./scripts/workspaces.lua;
    #   executable = true;
    # };
  };
}
