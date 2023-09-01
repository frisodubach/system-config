{ config, pkgs, ... }:

{
  home-manager.users.phonon = { pkgs, ... }: {
    home.stateVersion = "23.05";

    programs.alacritty = {
      enable = true;
      settings = {
        import = [ ./themes/gruvbox_dark.yml ];

        window = {
          opacity = 0.9;
          decorations = "full";
          dynamic_title = true;
        };

        font.normal = {
          family = "Fira Code";
          style = "Regular";
        };

      };
    };
  };
}
