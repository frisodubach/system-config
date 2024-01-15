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
          "sudo nixos-rebuild switch --flake /home/phonon/.config/system-config/#electron";
        nix-dry =
          "sudo nixos-rebuild dry-activate --flake /home/phonon/.config/system-config/#electron";
        nix-upgr =
          "nix flake update && sudo nixos-rebuild boot --upgrade --flake /home/phonon/.config/system-config/#electron";
        ll = "eza -l";
        la = "eza -la";
        doom-sync = "~/.emacs.d/bin/doom sync";
        doom-upgrade = "~/.emacs.d/bin/doom upgrade";
        ssh-vpn = "mullvad-exclude ssh";
      };
    };
  };
}
