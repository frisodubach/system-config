{ config, lib, pkgs, inputs, ... }:

# Goals:
# - GUI apps for managing Wifi / Bluetooth
# - Scipts for managing brightness / volume / mic / nightlight
# - EWW bar w/ workspace indicator, basic system settings, time / calendar, system info, app launcher
# - App launcher (rofi / Fuzzel)
# - Keyboard shortcuts (M-e, M-1/2/3/etc, M-w, M-m, etc)
# - Touchpad gestures
# - Dynamic display settings
# - Locking application
# - Notification daemon
# - Screenshot tool
# - Wallpaper engine
# - Clipboard manager
# - File manager
# - Photo viewer
# - Calculator
# - Font manager

{
  environment.variables = rec {
    MOZ_ENABLE_WAYLAND = "1";
    MOZ_GTK_TITLEBAR_DECORATION = "client";
  };

  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-wlr
      xdg-desktop-portal-kde
      xdg-desktop-portal-gnome
    ];
  };

  services.xserver = {
    enable = true;
    desktopManager.gnome.enable = true;
    displayManager.gdm = {
      enable = true;
      wayland = true;
    };
  };

  environment.systemPackages = with pkgs; [
    # GNOME extensions and
    gnomeExtensions.dash-to-dock
    gnomeExtensions.user-themes
    gnomeExtensions.aylurs-widgets
    gnomeExtensions.just-perfection
    gnomeExtensions.hide-top-bar
    gnomeExtensions.rounded-window-corners
    gnome3.gnome-tweaks

    # GTK/icon themes
    nordic
    whitesur-gtk-theme
    colloid-gtk-theme
    gruvbox-gtk-theme
    kora-icon-theme
  ];

  environment.gnome.excludePackages = with pkgs.gnome; [
    epiphany
    gnome-contacts
    gnome-maps
    # gnome-weather
    geary
    # evince
    totem
    yelp
    simple-scan
    cheese
    gnome-clocks
    seahorse
    gnome-calendar
    # gnome-tour
    gnome-music
    # gnome-connections
  ];

  hardware.opengl = {
    enable = true;
    driSupport = true;
  };

}
