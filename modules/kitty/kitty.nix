{ config, lib, pkgs, ... }:

{
  home-manager.users.phonon = { pkgs, ... }: {
    home.stateVersion = "22.11";

    programs.kitty = {
      enable = true;
      shellIntegration.enableFishIntegration = true;
      theme = "Gruvbox Dark";

      # Font configuration
      font = { name = "Fira Code"; };

      settings = {
        enable_audio_bell = false;
        close_on_child_death = true;
        cursor_blink_interval = 0;
        hide_window_decorations = "yes";
      };

    };
  };

}
