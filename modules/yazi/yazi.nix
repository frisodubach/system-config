{ config, lib, pkgs, nixpkgs-unstable, inputs, ... }:

# let unstable = import inputs.nixpkgs-unstable { system = mySystem; };
let unstable = import inputs.nixpkgs-unstable { system = "x86_64-linux"; };
in {
  environment.systemPackages = with pkgs; [ unstable.yazi ];

  home-manager.users.phonon = { pkgs, ... }: {
    home.stateVersion = "22.11";

    programs.yazi = {
      enable = true;
      package = unstable.yazi;
      enableFishIntegration = true;
    };

    home.file.".config/yazi/theme.toml" = {
      source = ./theme.toml;
      executable = false;
      recursive = false;
    };

    home.file.".config/yazi/yazi.toml" = {
      source = ./yazi.toml;
      executable = false;
      recursive = false;
    };

    xdg.desktopEntries = {
      yazi = {
        name = "yazi";
        genericName = "yazi";
        exec = "yazi";
        terminal = true;
        categories = [ "System" ];
      };
    };

  };
}
