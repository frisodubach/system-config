{ inputs, config, lib, pkgs, ... }:

# https://github.com/vimjoyer/nix-firefox-video
# https://github.com/0bCdian/Hyprland_dotfiles/tree/Cozy_Gruvbox/chrome
# https://github.com/FirefoxCSSThemers/GruvFox

{
  home-manager.users.phonon = { pkgs, ... }: {
    home.stateVersion = "22.11";

    home.packages = with pkgs; [ librewolf ];

    # Config

  };
}
