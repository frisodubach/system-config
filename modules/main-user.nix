{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  services.emacs = {
    enable = true;
    install = true;
    package = pkgs.emacs;
  };
  
#  nixpkgs.overlays = [
#    (import (builtins.fetchTarball https://github.com/nix-community/emacs-overlay/archive/master.tar.gz))
#  ];
  
  programs.fish.enable = true;
  users.defaultUserShell = pkgs.fish;

  users.users = {
    phonon = {
      isNormalUser = true;
      description = "phonon";
      extraGroups = [ "networkmanager" "wheel" "audo" "video" ];
      #initialPassword = "password";
    };
  };

  home-manager.users.phonon = { pkgs, ... }: {
    home.stateVersion = "23.05";

    home.packages = with pkgs; [
      #Important applications
      fish
      librewolf
      vscodium
      zotero
      bitwarden
      vorta
      sherlock
      amberol
      signal-desktop
      albert
      starship
      kid3
      wofi
      #emacs
      #emacsGcc
    ];
    #xdg.mimeApps.defaultApplications = {
    #  "image/png" = "feh.desktop";
    #  "image/jpeg" = "feh.desktop";
    #  "text/plain" = "gvim";
    #};
    home.sessionPath = [ "~/.emacs.d/bin/" ];
  };
}
