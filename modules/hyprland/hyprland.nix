{ inputs, config, pkgs, lib, modulesPath, ... }:

{

  # === Hyprland ===
  imports = [ inputs.hyprland.nixosModules.default ];

  nix.settings = {
    substituters = [ "https://hyprland.cachix.org" ];
    trusted-public-keys =
      [ "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc=" ];
  };

  # Module from inputs.hyprland substitutes nixpkgs `programs.hyprland` with its own,
  # allowing for pulling the latest changes once they are available.
  # Besides installing the Hyprland package, this module sets some system-wide configuration
  # (e.g. polkit, xdg-desktop-portal-hyprland)
  programs.hyprland.enable = true;

  # === Environment variables ===
  environment.variables = rec {
    MOZ_ENABLE_WAYLAND = "1";
    MOZ_GTK_TITLEBAR_DECORATION = "client";

    #newm environment variables
    TDESKTOP_DISABLE_GTK_INTEGRATION = "1";
    CLUTTER_BACKEND = "wayland";
    BEMENU_BACKEND = "wayland";
    XDG_SESSION_TYPE = "wayland";
    XDG_SESSION_DESKTOP = "Hyprland";
    XDG_CURRENT_DESKTOP = "Hyprland";
    XDG_CURRENT_SESSION = "Hyprland";
    GDK_BACKEND = "wayland,x11";
    # WAYLAND_DISPLAY = "wayland-0";
    # DISPLAY = ":0";
  };

  xdg.portal = { enable = true; };

  hardware.opengl = {
    enable = true;
    driSupport = true;
  };

  # === Greeter ===
  services.xserver = {
    enable = true;
    desktopManager.xterm.enable = false;
    displayManager = {
      defaultSession = "hyprland";
      lightdm = {
        enable = false;
        greeters.gtk = {
          enable = false;
          theme.name = "Gruvbox-Dark-B";
        };
      };
      gdm = {
        enable = true;
        wayland = true;
      };
    };
  };

  environment.systemPackages = with pkgs; [

    # Basic apps
    # newm-atha
    libglvnd
    seatd
    wayland

    greetd.gtkgreet
    swayidle

    # basic tools
    # - Scipts for managing brightness / volume / mic / nightlight
    # - Dynamic display settings - SwayOSD
    # - Screenshot tool
    # - Wallpaper engine - swaybg/hyprpaper
    # - Clipboard manager
    # - File manager - thunar/nautilus/terminal based?
    # - Photo viewer -
    # - Calculator

    # Basic system tools
    gnome.nautilus # gui file manager
    xfce.thunar # gui file manager
    libnotify # notification daemon
    brightnessctl
    wlr-randr
    xdg-utils
    wofi # application launcher
    networkmanager # gui network manager
    swaybg # wallpaper engine
    swayosd
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
    # vimiv-qt
    # Calc

    # Font Manager
    font-manager

    # GTK/icon themes
    # nordic
    # whitesur-gtk-theme
    # colloid-gtk-theme
    gruvbox-gtk-theme
    kora-icon-theme
    capitaine-cursors-themed
  ];

  # === HOME MANAGER ===
  home-manager.users.phonon = { pkgs, ... }: {
    home.stateVersion = "22.11";

    # Don't understand this well.
    imports = [ inputs.hyprland.homeManagerModules.default ];

    # Enable hyprland
    wayland.windowManager.hyprland = {
      enable = true;
      package = null; # Use system-wide package
      xwayland.enable = true;
      extraConfig = import ./config.nix { };
    };

    # Home-manager GTK theme / cursor theme [WIP]
    home.pointerCursor = {
      name = "Capitaine Cursors (Gruvbox)";
      package = pkgs.capitaine-cursors-themed;
      size = 24;
      gtk.enable = true;
    };

    gtk = {
      enable = true;
      theme = {
        package = pkgs.gruvbox-gtk-theme;
        name = "Gruvbox-Dark-B";
      };
      iconTheme = {
        package = pkgs.kora-icon-theme;
        name = "kora";
      };
      # cursorTheme = {
      #   package = pkgs.capitaine-cursors-themed;
      #   name = "Capitaine Cursors (Gruvbox)";
      # };
    };

    qt = {
      enable = true;
      platformTheme = "gtk";
    };

    home.packages = with pkgs;
      [
        # hyprland
        eww-wayland
      ];

  };

}
