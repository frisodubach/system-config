{ config, pkgs, ... }:

{
  # nixpkgs.config.allowUnfree = true; # depcracted. Need new solution

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
    home.stateVersion = "22.11";

    home.packages = with pkgs; [
      #Important applications
      fish
      librewolf
      zotero
      bitwarden
      vorta
      signal-desktop
      sherlock
      amberol
      museeks
      lollypop
      starship
      kid3
      tor-browser-bundle-bin

      # Temp
      gnome.nautilus
    ];

    home.sessionPath = [ "~/.emacs.d/bin/" ];
  };
}
