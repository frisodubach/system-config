{ inputs, config, lib, pkgs, ... }:

{
  home-manager.users.phonon = { pkgs, ... }: {
    home.stateVersion = "23.05";

    home.packages = with pkgs; [ gtklock ];

    home.file.".config/gtklock/config.ini" = { source = ./config.ini; };

    home.file.".config/gtklock/style.css" = { source = ./style.css; };

  };
}
