{ config, lib, pkgs, ... }:

{
  home-manager.users.phonon = { pkgs, ... }: {
    home.stateVersion = "23.05";

    services.mako = {
      enable = true;
      extraConfig = import ./config.nix { };
    };
  };
}
