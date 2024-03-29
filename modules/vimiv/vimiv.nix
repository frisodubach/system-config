{ inputs, config, lib, pkgs, ... }:

{
  home-manager.users.phonon = { pkgs, ... }: {
    home.stateVersion = "22.11";

    home.packages = with pkgs; [ vimiv-qt ];

    home.file.".config/vimiv/vimiv.conf" = { source = ./vimiv.conf; };

    home.file.".config/vimiv/keys.conf" = { source = ./keys.conf; };

    home.file.".config/vimiv/styles/style.conf" = { source = ./style.conf; };
  };
}
