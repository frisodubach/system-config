{ config, pkgs, ... }:

{
  imports = [ ./main-user.nix ./fish.nix ./gnome.nix ];

  environment.sessionVariables = rec {
    XDG_CACHE_HOME = "$HOME/.cache";
    XDG_CONFIG_HOME = "$HOME/.config";
    XDG_DATA_HOME = "$HOME/.local/share";
    XDG_STATE_HOME = "$HOME/.local/state";

    # Not officially in the specification
    #XDG_BIN_HOME    = "$HOME/.local/bin";
    #PATH = [
    #  "${XDG_BIN_HOME}"
    #];
  };

  environment.systemPackages = with pkgs; [
    # basic CLI utlilities
    git
    vim
    wget
    fd
    ripgrep
    htop
    unzip
    powertop
    smartmontools # Get SMART data
    tldr
    fzf

    # emacs package dependencies
    libtool
    clang
    cmake
    gnumake
    nixfmt
    shfmt

    # basic GUI applications
    firefox
    alacritty
    gimp
    signal-desktop
    emacs-gtk
    calibre

    # PDF utils
    ocrmypdf # Add OCR layer to PDF file
    qpdf # e.g. rotating, splitting, merging, encryption
    qpdfview # qpdfviewer

    # misc
    neofetch
    python

  ];

  programs.dconf.enable = true;

  programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  # ENABLE TAILSCALE
  service.tailscale.enable = true;

  # AUTO UPDATE DB
  services.locate = {
    enable = true;
    locate = pkgs.mlocate;
    interval = "daily";
    # warning: mlocate and plocate do not support the services.locate.localuser option. updatedb will run as root. Silence this warning by setting services.locate.localuser = null
    localuser = null;
  };

  # FONTS
  fonts.fonts = with pkgs; [
    fira-code
    fira
    fira-code-symbols
    jetbrains-mono
    powerline-fonts
    nerdfonts
    overpass
    (netfonts.override { fonts = [ "FiraCode" ]; })
  ];
}
