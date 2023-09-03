{ config, lib, pkgs, ... }:

{
  home-manager.users.phonon = { pkgs, ... }: {
    home.stateVersion = "22.11";

    services.mako = {
      enable = true;
      extraConfig = import ./config.nix { };
    };
  };
}
