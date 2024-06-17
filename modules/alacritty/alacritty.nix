{ config, pkgs, ... }:

{
  home-manager.users.phonon = { pkgs, ... }: {
    home.stateVersion = "22.11";

    programs.alacritty = {
      enable = true;
      settings = {
        import = [ ./themes/gruvbox_dark.toml ];

        window = {
          opacity = 1;
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
