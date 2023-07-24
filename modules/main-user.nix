{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  services.emacs = {
    enable = true;
    install = true;
    package = pkgs.emacs;
  };

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
      starship
      kid3
      wofi
      #emacs
    ];
    #xdg.mimeApps.defaultApplications = {
    #  "image/png" = "feh.desktop";
    #  "image/jpeg" = "feh.desktop";
    #  "text/plain" = "gvim";
    #};
    home.sessionPath = [ "~/.emacs.d/bin/" ];
  };
}
