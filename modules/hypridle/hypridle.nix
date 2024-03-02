{ config, lib, pkgs, nixpkgs-unstable, inputs, ... }:

# let unstable = import inputs.nixpkgs-unstable { system = mySystem; };
let unstable = import inputs.nixpkgs-unstable { system = "x86_64-linux"; };
in {
  environment.systemPackages = with pkgs; [ unstable.hypridle ];

  home-manager.users.phonon = { pkgs, ... }: {
    home.stateVersion = "22.11";

    home.file.".config/hypr/hypridle.conf" = {
      source = ./hypridle.conf;
      executable = false;
      recursive = false;
    };

  };
}
