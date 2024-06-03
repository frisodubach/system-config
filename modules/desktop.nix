{ config, pkgs, ... }:

{
  imports = [
    ./emacs/emacs.nix
    ./hyprland/hyprland.nix
    ./alacritty/alacritty.nix
    # ./kitty/kitty.nix
    ./eww/eww.nix
    # ./gtklock/gtklock.nix
    ./swaylock/swaylock.nix
    ./hyprlock/hyprlock.nix
    ./hypridle/hypridle.nix
    # ./wofi/wofi.nix
    ./rofi/rofi.nix
    ./mako/mako.nix
    ./vimiv/vimiv.nix
    # ./paisa/paisa.nix
    ./gruvbox/gruvbox.nix
    ./mullvad/mullvad.nix
    # ./joshuto/joshuto.nix
    ./yazi/yazi.nix
    ./zathura/zathura.nix
    ./xdgDefault/xdgDefault.nix
    ./scripts/scripts.nix
  ];

  environment.variables = {
    TERM = "alacritty";
    TERMINAL = "alacritty";
    EDITOR = "emacsclient";
  };

  home-manager.users.phonon = { pkgs, ... }: {
    home.stateVersion = "22.11";

    home.packages = with pkgs; [
      #Important applications
      librewolf
      firefox
      alacritty
      gimp
      calibre
      mullvad-browser
      bitwarden
      signal-desktop
      lollypop
      mpv
      tor-browser-bundle-bin

      # addtional programs
      zotero
      vorta
      sherlock
      amberol
      museeks
      starship
      kid3
      vial

      # PDF utils
      ocrmypdf # Add OCR layer to PDF file
      qpdf # e.g. rotating, splitting, merging, encryption
      qpdfview # qpdfviewer

      # Temp
      gnome.nautilus
      gparted
    ];

  };
}
