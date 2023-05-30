{ config, pkgs, ... }:

{
  home-manager.users.phonon = { pkgs, ... }: {
    home.stateVersion = "22.11";

    programs.fish = {
      enable = true;
      interactiveShellInit = ''
        set fish_greeting # Disable greeting
      '';
      shellAliases = {
        nix-rb =
          "nixos-rebuild switch --flake /home/phonon/.config/system-config/flake.nix";
        nix-dry =
          "nixos-rebuild dry-activate --flake /home/phonon/.config/system-config/flake.nix";
      };
    };
  };
}
