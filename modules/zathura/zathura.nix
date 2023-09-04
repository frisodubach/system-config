{ inputs, config, lib, pkgs, ... }:

{
  home-manager.users.phonon = { pkgs, ... }: {
    home.stateVersion = "22.11";

    home.packages = with pkgs; [ zathura ];

    # Config
    home.file.".config/zathura/zathurarc" = { source = ./zathurarc; };

    home.file.".config/zathura/gruvbox-dark" = { source = ./gruvbox-dark; };

  };
}
