{ config, pkgs, ... }:

{
  imports = [
    ./main-user.nix
    ./fish/fish.nix
    ./hyprland/hyprland.nix
    ./alacritty/alacritty.nix
    ./eww/eww.nix
    # ./gtklock/gtklock.nix
    ./swaylock/swaylock.nix
    ./wofi/wofi.nix
    ./mako/mako.nix
    ./vimiv/vimiv.nix
    ./gruvbox/gruvbox.nix
    ./mullvad/mullvad.nix
    ./joshuto/joshuto.nix
    ./zathura/zathura.nix
    ./xdgDefault/xdgDefault.nix
  ];

  environment.sessionVariables = rec {
    XDG_CACHE_HOME = "$HOME/.cache";
    XDG_CONFIG_HOME = "$HOME/.config";
    XDG_DATA_HOME = "$HOME/.local/share";
    XDG_STATE_HOME = "$HOME/.local/state";
  };

  environment.variables = {
    TERM = "alacritty";
    TERMINAL = "alacritty";
    EDITOR = "emacsclient";
  };

  environment.systemPackages = with pkgs; [
    # basic CLI utlilities
    git
    vim
    wget
    fd # better find
    ripgrep # better grep
    htop
    gotop
    unzip
    powertop
    smartmontools # Get SMART data
    tldr # man alternative
    fzf # fuzzy finder
    eza # ls alternative
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
    (aspellWithDicts (dicts: with dicts; [ en en-computers en-science ]))

    # basic GUI applications
    firefox
    alacritty
    gimp
    emacs-gtk
    calibre
    mullvad-browser

    # PDF utils
    ocrmypdf # Add OCR layer to PDF file
    qpdf # e.g. rotating, splitting, merging, encryption
    qpdfview # qpdfviewer

    # misc
    neofetch

    # coding
    clojure
    clojure-lsp
    go
    gopls
  ];

  programs = {
    # dconf.enable = true;
    mtr.enable = true;
    nm-applet.enable = true;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
  };

  # ENABLE TAILSCALE
  services.tailscale.enable = true;
  networking.firewall.trustedInterfaces = [ "tailscale0" ];

  # AUTO UPDATE DB
  services.locate = {
    enable = true;
    package = pkgs.mlocate;
    interval = "daily";
    # warning: mlocate and plocate do not support the services.locate.localuser option. updatedb will run as root. Silence this warning by setting services.locate.localuser = null
    localuser = null;
  };

  # FONTS
  fonts = {
    enableDefaultPackages = true;
    packages = with pkgs; [
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
