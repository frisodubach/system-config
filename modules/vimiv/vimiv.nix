{ inputs, config, lib, pkgs, ... }:

{
  home-manager.users.phonon = { pkgs, ... }: {
    home.stateVersion = "23.05";

    home.packages = with pkgs; [ vimiv-qt ];

    home.file.".config/vimiv/vimiv.conf" = { source = ./vimiv.conf; };

    home.file.".config/vimiv/keys.conf" = { source = ./keys.conf; };

    home.file.".config/vimiv/style.conf" = { source = ./style.conf; };
  };
}
