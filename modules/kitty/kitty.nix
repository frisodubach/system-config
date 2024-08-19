{ config, lib, pkgs, ... }:

{
  home-manager.users.phonon = { pkgs, ... }: {
    home.stateVersion = "22.11";

    programs.kitty = {
      enable = true;
      shellIntegration.enableFishIntegration = true;
      theme = "Gruvbox Dark Soft";

      # Font configuration
      font = {
        name = "Fira Code";
        size = 14;
      };

      keybindings = {
        "ctrl+tab" = "next_tab";
        "ctrl+shift+tab" = "previous_tab";
      };

      settings = {
        enable_audio_bell = false;
        close_on_child_death = true;
        cursor_blink_interval = 0;
        cursor_shape = "block";
        cursor_shape_unfocused = "hollow";
        shell_integration = "no-cursor";
        hide_window_decorations = "yes";

        tab_bar_min_tabs = 1;
        tab_bar_edge = "top";
        # tab_bar_style = "separator";
        # tab_separator = " | ";
        tab_bar_style = "powerline";
        tab_powerline_style = "slanted";
        # tab_title_template =
        #   "{title}{' :{}:'.format(num_windows) if num_windows > 1 else ''}";
        active_tab_foreground = "#665C54";
        active_tab_background = "#BDAE93";
        active_tab_font_style = "bold-italic";
        inactive_tab_foreground = "#BDAE93";
        inactive_tab_background = "#665C54";
        inactive_tab_font_style = "normal";

        confirm_os_window_close = 0;

        # enabled_layouts = "splits, stack";
      };

    };
  };

}
