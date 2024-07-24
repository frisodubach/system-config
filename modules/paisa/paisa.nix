{ config, lib, pkgs, inputs, ... }:

{
  imports = [ inputs.paisa.nixosModules.default ];

  # environment.systemPackages = with pkgs;
  #   [ inputs.paisa.packages.${pkgs.system}.default ];

  environment.systemPackages = with pkgs; [ paisa-cli paisa ];
}
