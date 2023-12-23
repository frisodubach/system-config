{ inputs, config, lib, pkgs, ... }:

{
  security.sudo = {
    # enable = true;
    extraRules = [{
      commands = [
        {
          command = "${pkgs.systemd}/bin/systemctl suspend";
          options = [ "NOPASSWD" ];
        }
        {
          command = "${pkgs.systemd}/bin/reboot";
          options = [ "NOPASSWD" ];
        }
        {
          command = "${pkgs.systemd}/bin/poweroff";
          options = [ "NOPASSWD" ];
        }
        {
          command = "${pkgs.tlp}/bin/tlp";
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

    # Config
    # home.file.".config/eww/eww.scss" = {
    #   source = ./eww.scss;
    #   enable = true;
    # };

    # home.file.".config/eww/eww.yuck" = {
    #   source = ./eww.yuck;
    #   enable = true;
    # };

    #scripts
    home.file.".config/eww" = {
      source = ./bar1;
      executable = true;
      recursive = true;
    };

  };
}
