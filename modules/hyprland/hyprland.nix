{ inputs, config, pkgs, lib, modulesPath, ... }:

{

  # Necessary for Hyprland git-version (inputs)
  # imports = [ inputs.hyprland.nixosModules.default ];

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

    #Hyprland environment variables
    TDESKTOP_DISABLE_GTK_INTEGRATION = "1";
    CLUTTER_BACKEND = "wayland";
    BEMENU_BACKEND = "wayland";
    XDG_SESSION_TYPE = "wayland";
    XDG_SESSION_DESKTOP = "Hyprland";
    XDG_CURRENT_DESKTOP = "Hyprland";
    XDG_CURRENT_SESSION = "Hyprland";
    GDK_BACKEND = "wayland,x11";
    WAYLAND_DISPLAY = "wayland-1";
    # DISPLAY = ":0";
  };

  xdg.portal = {
    enable = true;
    config.common.default = "*";
  };

  hardware.opengl = {
    enable = true;
    driSupport = true;
  };

  # === Greeter ===
  services.displayManager.defaultSession = "hyprland";
  services.xserver = {
    excludePackages = [ pkgs.xterm ];
    enable = true;
    desktopManager.xterm.enable = false;
    displayManager = {
      lightdm = {
        enable = false;
        greeters.gtk = {
          enable = false;
          theme.name = "Gruvbox-Dark";
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
    libglvnd
    seatd
    wayland

    greetd.gtkgreet
    swayidle

    # Basic system tools
    libnotify # notification daemon
    brightnessctl
    wlr-randr
    xdg-utils
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

    # Font Manager
    font-manager
  ];

  # === HOME MANAGER ===
  home-manager.users.phonon = { pkgs, ... }: {
    home.stateVersion = "22.11";

    # Sourcing the home-manager module
    # Necessary for Hyprland git-version (inputs)
    # imports = [ inputs.hyprland.homeManagerModules.default ];

    # Enable hyprland
    wayland.windowManager.hyprland = {
      enable = true;
      # package = null; # Use system-wide package -- Not required anymore?
      xwayland.enable = true;
      extraConfig = import ./config.nix { };
    };

  };

}
