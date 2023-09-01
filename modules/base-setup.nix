{ config, pkgs, ... }:

{
  imports = [
    ./main-user.nix
    ./fish.nix
    ./hyprland/hyprland.nix
    ./alacritty.nix
    # ./dunst.nix
    ./hyprland/swaylock.nix
    ./eww/eww.nix
    # ./waybar/waybar.nix
    ./gtklock/gtklock.nix
    ./wofi/wofi.nix
    ./mako/mako.nix
  ];

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
    fd # better find
    ripgrep # better grep
    htop
    unzip
    powertop
    smartmontools # Get SMART data
    tldr # man alternative
    fzf # fuzzy finder
    exa # ls alternative
    bat # cat alternative
    ncdu # du alternative
    duf # df alternative

    # emacs package dependencies
    libtool
    clang
    cmake
    gnumake
    nixfmt
    shfmt
    coreutils
    fd
    ripgrep
    git

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
    #python3

  ];

  programs = {
    dconf.enable = true;
    mtr.enable = true;
    nm-applet.enable = true;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
  };

  # ENABLE TAILSCALE
  services.tailscale.enable = true;

  # AUTO UPDATE DB
  services.locate = {
    enable = true;
    locate = pkgs.mlocate;
    interval = "daily";
    # warning: mlocate and plocate do not support the services.locate.localuser option. updatedb will run as root. Silence this warning by setting services.locate.localuser = null
    localuser = null;
  };

  # AUTO UPDATE NIX
  #system.autoUpgrade.enable = true; # Can't use this with flake config

  # FONTS
  fonts = {
    enableDefaultFonts = true;
    fonts = with pkgs; [
      fira-code
      fira
      fira-code-symbols
      jetbrains-mono
      powerline-fonts
      nerdfonts
      overpass
      (nerdfonts.override { fonts = [ "FiraCode" ]; })
    ];
  };
}
