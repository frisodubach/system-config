{ config, lib, pkgs, ... }:

{

  environment.variables = {
    TERM = "alacritty";
    TERMINAL = "alacritty";
    EDITOR = "emacsclient";
  };

  environment.sessionVariables = rec {
    TERM = "alacritty";
    TERMINAL = "alacritty";
    EDITOR = "emacsclient";
  };

  home-manager.users.phonon = { pkgs, ... }: {
    home.stateVersion = "22.11";
    xdg.mimeApps = {
      enable = true;

      associations.added = {
        "text/plain" = "emacsclient.desktop";
        "text/html" = "librewolf.desktop";
        "application/pdf" = "org.pwmt.zathura-pdf-mupdf.desktop";
        "image/jpeg" = "vimiv.desktop";
        "image/png" = "vimiv.desktop";

        "x-scheme-handler/chrome" = "librewolf.desktop";
        "x-scheme-handler/http" = "librewolf.desktop";
        "x-scheme-handler/https" = "librewolf.desktop";

        "x-scheme-handler/signalcaptcha" = "signal-desktop.desktop";

        "video/mp4" = "mpv.desktop";
        "video/x-matroska" = "mpv.desktop";
      };

      defaultApplications = {
        "text/plain" = "emacsclient.desktop";
        "text/html" = "librewolf.desktop";
        "application/pdf" = "org.pwmt.zathura-pdf-mupdf.desktop";
        "image/jpeg" = "vimiv.desktop";
        "image/png" = "vimiv.desktop";

        "x-scheme-handler/chrome" = "librewolf.desktop";
        "x-scheme-handler/http" = "librewolf.desktop";
        "x-scheme-handler/https" = "librewolf.desktop";

        "x-scheme-handler/signalcaptcha" = "signal-desktop.desktop";

        "video/mp4" = "mpv.desktop";
        "video/x-matroska" = "mpv.desktop";
      };
    };
  };
}
