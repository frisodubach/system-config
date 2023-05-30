{ config, pkgs, ... }:

{
  home-manager.users.phonon = { pkgs, ... }: {
    home.stateVersion = "22.11";

    programs.alacritty = {
      enable = true;
      settings = {
        import = [
          #../dotfiles/.config/alacritty/themes/gruvbox_light.yml
          #../dotfiles/.config/alacritty/themes/gruvbox_material.yml
          ../dotfiles/.config/alacritty/themes/gruvbox_dark.yml
        ];

        window = {
          opacity = 1.0;
          decorations = "none";
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
