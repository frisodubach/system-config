{
  description = "Automatic system configuration using flakes for electron";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-23.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland.url = "github:hyprwm/Hyprland/v0.34.0";
  };

  outputs = inputs@{ self, nixpkgs, nixpkgs-unstable, home-manager, hyprland }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        # config = { allowUnfree = true; }; # depracated. Need new solution
      };

      lib = nixpkgs.lib;

    in {
      nixosConfigurations = {
        electron = lib.nixosSystem {
          inherit system;
          inherit pkgs;
          specialArgs = { inherit inputs; };
          modules = [
            ./hosts/electron/default.nix
            ./modules/base-setup.nix

            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
            }
          ];
        };
      };
    };
}
