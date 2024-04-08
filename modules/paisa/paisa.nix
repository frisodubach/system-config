{ config, lib, pkgs, inputs, paisa, ... }:

{
  environment.systemPackages = with pkgs;
    [ inputs.paisa.packages.${pkgs.system}.default ];
}
