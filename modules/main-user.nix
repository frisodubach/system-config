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

    xdg.mimeApps = {
      enable = true;

      associations.added = {
        "text/plain" = "emacsclient.desktop";
        "application/pdf" = "zotero.desktop";
        "image/jpeg" = "vimim.desktop";
        "image/png" = "vimim.desktop";

        "x-scheme-handler/chrome" = "librewolf.desktop";
        "x-scheme-handler/http" = "librewolf.desktop";
        "x-scheme-handler/https" = "librewolf.desktop";
      };

      defaultApplications = {
        "text/plain" = "emacsclient.desktop";
        "application/pdf" = "zotero.desktop";
        "image/jpeg" = "vimim.desktop";
        "image/png" = "vimim.desktop";

        # For personal stuff
        "x-scheme-handler/chrome" = "librewolf.desktop";
        "x-scheme-handler/http" = "librewolf.desktop";
        "x-scheme-handler/https" = "librewolf.desktop";
      };
    };
    home.sessionPath = [ "~/.emacs.d/bin/" ];
  };
}
