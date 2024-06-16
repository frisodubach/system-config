{
  description = "Automatic system configuration using flakes for electron";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland = {
      type = "git";
      url = "https://github.com/hyprwm/Hyprland";
      submodules = true;
    };
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
