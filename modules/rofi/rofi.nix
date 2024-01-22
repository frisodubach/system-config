{ config, lib, pkgs, ... }:

{
  home-manager.users.phonon = { pkgs, ... }: {
    home.stateVersion = "22.11";

    home.packages = with pkgs; [ rofi-wayland ];

    # Config
    home.file.".config/rofi/config.rasi" = { source = ./config.rasi; };
  };

}
