{ pkgs, config, lib, ... }:

{
  # Without this, swaylock will not recognize password
  security.pam.services.swaylock = { };

  home-manager.users.phonon = {
    home.stateVersion = "23.05";

    programs.swaylock = {
      enable = true;
      package = pkgs.swaylock-effects;
      settings = {
        key-hl-color = "459599";
        line-color = "bdae93";
        inside-color = "282828";

        color = "32302f";
        layout-bg-color = "32302f";
        ring-color = "2b2e37";
        ring-ver-color = "b8bb26";
        inside-wrong-color = "cc241d";
        inside-ver-color = "32302f";
        indicator-idle-visible = true;
        indicator-radius = 120;
        text-color = "ebdbb2";
        daemonize = true;
        ignore-empty-password = true;
        show-failed-attempts = true;
      };
    };
  };
}
