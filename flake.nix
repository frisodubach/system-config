{
  description = "Automatic system configuration using flakes for electron";

  nixConfig = {
    substituters = [ "https://hyprland.cachix.org" ];
    trusted-public-keys =
      [ "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc=" ];
  };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-23.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland.url = "github:hyprwm/Hyprland/v0.27.2";
  };

  outputs = inputs@{ self, nixpkgs, nixpkgs-unstable, home-manager, hyprland }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config = { allowUnfree = true; };
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

            # hyprland.homeManagerModules.default
            # {
            #   wayland.windowManager.hyprland = {
            #     enable = true;
            #     package = null;
            #   };
            # }
          ];
        };
      };
    };
}
