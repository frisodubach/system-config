{ config, pkgs, ... }:
let
  rofi-bluetooth = pkgs.writeShellScriptBin "rofi-bluetooth"
    (builtins.readFile ./rofi-bluetooth);
  rofi-mullvad =
    pkgs.writeShellScriptBin "rofi-mullvad" (builtins.readFile ./rofi-mullvad);
  rofi-power =
    pkgs.writeShellScriptBin "rofi-power" (builtins.readFile ./rofi-power);
  rofi-wifi =
    pkgs.writeShellScriptBin "rofi-wifi" (builtins.readFile ./rofi-wifi);
in {
  environment.systemPackages = with pkgs; [
    rofi-bluetooth
    rofi-mullvad
    rofi-power
    rofi-wifi
  ];

  security.sudo = {
    extraRules = [{
      users = [ "phonon" ];
      commands = [
        {
          command = "/run/current-system/sw/bin/systemctl suspend";
          options = [ "NOPASSWD" ];
        }
        {
          command = "/run/current-system/sw/bin/reboot";
          options = [ "NOPASSWD" ];
        }
        {
          command = "/run/current-system/sw/bin/poweroff";
          options = [ "NOPASSWD" ];
        }
      ];
    }];
  };

  home-manager.users.phonon = { pkgs, ... }: {
    home.stateVersion = "22.11";

    xdg.desktopEntries = {
      rofi-bluetooth = {
        name = "Bluetooth Menu";
        genericName = "Bluetooth Menu";
        exec = "rofi-bluetooth";
        terminal = false;
        categories = [ "System" ];
      };
      rofi-mullvad = {
        name = "Mullvad Menu";
        genericName = "Mullvad Menu";
        exec = "rofi-mullvad";
        terminal = false;
        categories = [ "System" ];
      };
      rofi-power = {
        name = "Power Menu";
        genericName = "Power Menu";
        exec = "rofi-power";
        terminal = false;
        categories = [ "System" ];
      };
      rofi-wifi = {
        name = "Wifi Menu";
        genericName = "Wifi Menu";
        exec = "rofi-wifi";
        terminal = false;
        categories = [ "System" ];
      };
    };
  };

}
