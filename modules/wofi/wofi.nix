{ inputs, config, lib, pkgs, ... }:

{
  home-manager.users.phonon = { pkgs, ... }: {
    home.stateVersion = "23.05";

    home.packages = with pkgs; [ wofi ];

    # Config
    home.file.".config/wofi/config" = { source = ./config; };
    home.file.".config/wofi/style.css" = { source = ./style2.css; };
  };
}