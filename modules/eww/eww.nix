{ inputs, config, lib, pkgs, ... }:

{
  home-manager.users.phonon = { pkgs, ... }: {
    home.stateVersion = "23.05";

    home.packages = with pkgs; [ eww-wayland lua pamixer brightnessctl ];

    # programs.eww.enable = true;

    # Config
    # home.file.".config/eww/eww.scss" = {
    #   source = ./eww.scss;
    #   enable = true;
    # };

    # home.file.".config/eww/eww.yuck" = {
    #   source = ./eww.yuck;
    #   enable = true;
    # };

    #scripts
    home.file.".config/eww" = {
      source = ./bar1;
      executable = true;
      recursive = true;
    };

  };
}
