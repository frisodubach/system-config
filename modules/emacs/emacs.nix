{ config, lib, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    emacs-gtk

    # emacs package dependencies
    libtool
    clang
    cmake
    gnumake
    nixfmt-classic
    shfmt
    coreutils
    fd
    ripgrep
    git
    (aspellWithDicts (dicts: with dicts; [ en en-computers en-science ]))

    git
    fd # better find
    ripgrep # better grep
  ];

  services.emacs = {
    enable = true;
    install = true;
    package = pkgs.emacs;
  };

  home-manager.users.phonon = { pkgs, ... }: {
    home.stateVersion = "22.11";
    home.sessionPath = [ "~/.emacs.d/bin/" ];
  };
}
