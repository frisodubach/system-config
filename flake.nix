{
  description = "Automatic system configuration using flakes for electron";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # hyprland = {
    #   type = "git";
    #   url = "https://github.com/hyprwm/Hyprland?ref=v0.41.2";
    #   submodules = true;
    # };
    # gbar.url = "github:scorpion-26/gBar";
  };

  outputs = inputs@{ self, nixpkgs, nixpkgs-unstable, home-manager }:
    let
      system = "x86_64-linux";
      commonArgs = {
        inherit system;
        config.allowUnfree = true;
      };

      pkgs = import nixpkgs commonArgs;
      pkgs-unstable = import nixpkgs-unstable commonArgs;

      lib = nixpkgs.lib;

    in {
      nixosConfigurations = {
        electron = lib.nixosSystem {
          # inherit system;
          inherit pkgs;
          specialArgs = {
            inherit inputs;
            inherit pkgs-unstable;
          };
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
