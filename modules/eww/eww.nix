{ inputs, config, lib, pkgs, ... }:

{
  security.sudo = {
    # enable = true;
    extraRules = [{
      users = [ "phonon" ];
      commands = [
        {
          command = "${pkgs.tlp}/bin/tlp"; # This doesn't work due to symlink
          options = [ "NOPASSWD" ];
        }
        {
          command = "/run/current-system/sw/bin/tlp";
          options = [ "NOPASSWD" ];
        }
      ];
      # groups = [ "wheel" ];
    }];
  };

  home-manager.users.phonon = { pkgs, ... }: {
    home.stateVersion = "22.11";

    home.packages = with pkgs; [ eww-wayland lua pamixer brightnessctl ];

    # programs.eww.enable = true;

    #scripts
    home.file.".config/eww" = {
      source = ./bar;
      executable = true;
      recursive = true;
    };

  };
}
