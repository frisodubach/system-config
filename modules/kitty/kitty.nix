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

        tab_bar_min_tabs = 1;
        tab_bar_edge = "bottom";
        # tab_bar_style = "separator";
        # tab_separator = " | ";
        tab_bar_style = "powerline";
        tab_powerline_style = "slanted";
        # tab_title_template =
        #   "{title}{' :{}:'.format(num_windows) if num_windows > 1 else ''}";

        enabled_layouts = "splits, stack";
      };

    };
  };

}
