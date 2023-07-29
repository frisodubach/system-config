# This is a newm config. Need to edit properly
# Later best to separate into dedicated folders for each module
# Although I'm not a fan of that config method..

{ config, pkgs, lib, modulesPath, inputs, newmpkgs, ... }:

{

  # === Hyprland ===
  imports = [ inputs.hyprland.nixosModules.default ./swaylock.nix ];

  # nix.settings = {
  #   substituters = [ "https://hyprland.cachix.org" ];
  #   trusted-public-keys =
  #     [ "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc=" ];
  # };

  # Module from inputs.hyprland substitutes nixpkgs `programs.hyprland` with its own,
  # allowing for pulling the latest changes once they are available.
  # Besides installing the Hyprland package, this module sets some system-wide configuration
  # (e.g. polkit, xdg-desktop-portal-hyprland)
  programs.hyprland.enable = true;

  nix.settings = {
    substituters = [ "https://hyprland.cachix.org" ];
    trusted-public-keys =
      [ "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc=" ];
  };

  # === Environment variables ===
  environment.variables = rec {
    MOZ_ENABLE_WAYLAND = "1";
    MOZ_GTK_TITLEBAR_DECORATION = "client";

    #newm environment variables
    TDESKTOP_DISABLE_GTK_INTEGRATION = "1";
    CLUTTER_BACKEND = "wayland";
    BEMENU_BACKEND = "wayland";
    XDG_SESSION_TYPE = "wayland";
    XDG_SESSION_DESKTOP = "wlroots";
    XDG_CURRENT_DESKTOP = "wlroots";
    XDG_CURRENT_SESSION = "wlroots";
  };

  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = with pkgs; [ xdg-desktop-portal-wlr xdg-desktop-portal-gtk ];
    gtkUsePortal = true;
  };

  hardware.opengl = {
    enable = true;
    driSupport = true;
  };

  # === Greeter ===
  #  services.xserver = {
  #    enable = true;
  #desktopManager.gnome.enable = true;
  #    displayManager = {
  #      defaultSession = "newm";
  #      lightdm = {
  #        greeters.gtk = {
  #          enable = true;
  #          theme.name = "Gruvbox-Dark-B";
  #        };
  #        enable = true;
  #wayland = true;
  #      };
  #    };
  #  };

  # services.greetd = {
  #   enable = true;
  #   settings = rec {
  #     initial_session = {
  #       command = "${pkgs.greetd.gtkgreet}/bin/gtkgreet -l";
  #       user = "phonon";
  #     };
  #     default_session = initial_session;
  #   };
  # };

  # environment.etc."greetd/environments".text = ''
  #   newm
  # '';

  environment.systemPackages = with pkgs; [

    # Basic apps
    # newm-atha
    libglvnd
    seatd
    wayland

    greetd.gtkgreet

    # basic tools
    # - Scipts for managing brightness / volume / mic / nightlight
    # - EWW bar w/ workspace indicator, basic system settings, time / calendar, system info, app launcher
    # - Dynamic display settings
    # - Locking application
    # - Screenshot tool
    # - Wallpaper engine
    # - Clipboard manager
    # - File manager
    # - Photo viewer
    # - Calculator
    # - Font manager

    # Basic system tools
    gnome.nautilus # gui file manager
    libnotify # notification daemon
    brightnessctl
    wlr-randr
    xdg-utils
    wofi # application launcher
    networkmanager # gui network manager
    lightlocker # lightDM screenlock
    hyprpaper # wallpaper engine
    # Audio
    pamixer
    playerctl
    helvum
    pavucontrol
    # Clipboard
    cliphist
    wl-clipboard
    # Screenshot
    grim
    slurp
    swappy
    # Photoviewer
    gnome.eog
    # Calc

    # Font Manager
    font-manager

    # GTK/icon themes
    nordic
    whitesur-gtk-theme
    colloid-gtk-theme
    gruvbox-gtk-theme
    kora-icon-theme
  ];

  # === HOME MANAGER ===
  home-manager.users.phonon = { pkgs, ... }: {
    home.stateVersion = "23.05";

    # Don't understand this well.
    imports = [ inputs.hyprland.homeManagerModules.default ];

    # Enable hyprland
    wayland.windowManager.hyprland = {
      enable = true;
      package = null; # Use system-wide package
    };

    home.packages = with pkgs;
      [
        # hyprland
        eww-wayland

        # wofi
        # swaybg
        # wlsunset
        # wl-clipboard
        # pamixer
        # brightnessctl
        # libnotify
        # lua
        # dunst # notifications

      ];

    # Config
    home.file.".config/hypr/hyprland.conf".source =
      ../dotfiles/.config/hypr/hyprland.conf;

    # === EWW ===
    # home.file.".config/eww/eww.scss".source = ../dotfiles/.config/eww/eww.scss;
    # home.file.".config/eww/eww.yuck".source = ../dotfiles/.config/eww/eww.yuck;

    # scripts
    # home.file.".config/eww/scripts/battery.sh" = {
    #   source = ../scripts/eww/battery.sh;
    #   executable = true;
    # };

    # home.file.".config/eww/scripts/wifi.sh" = {
    #   source = ../scripts/eww/wifi.sh;
    #   executable = true;
    # };

    # home.file.".config/eww/scripts/brightness.sh" = {
    #   source = ../scripts/eww/brightness.sh;
    #   executable = true;
    # };

    # home.file.".config/eww/scripts/workspaces.sh" = {
    #   source = ../scripts/eww/workspaces.sh;
    #   executable = true;
    # };

    # home.file.".config/eww/scripts/workspaces.lua" = {
    #   source = ../scripts/eww/workspaces.lua;
    #   executable = true;
    # };
  };

}
