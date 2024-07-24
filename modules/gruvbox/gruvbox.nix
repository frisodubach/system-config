{ config, lib, pkgs, ... }:

{

  environment.systemPackages = with pkgs; [
    gnome.gnome-themes-extra
    gruvbox-gtk-theme
    kora-icon-theme
    capitaine-cursors-themed
  ];

  home-manager.users.phonon = { pkgs, ... }: {
    home.stateVersion = "22.11";

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
        name = "Gruvbox-Dark";
      };
      iconTheme = {
        package = pkgs.kora-icon-theme;
        name = "kora";
      };
      cursorTheme = {
        package = pkgs.capitaine-cursors-themed;
        name = "Capitaine Cursors (Gruvbox)";
      };
    };

    home.sessionVariables.GTK_THEME = "Gruvbox-Dark";

    qt = {
      enable = true;
      platformTheme.name = "gtk";
    };
  };
}
