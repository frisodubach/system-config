{ config, lib, pkgs, ... }:

{
  home-manager.users.phonon = { pkgs, ... }: {
    home.stateVersion = "23.05";

    programs.starship = {
      enable = true;
      enableFishIntegration = true;
      settings = {
        format = lib.concatStrings [
          "[](#9A348E)"
          "$os"
          "$username"
          "[](bg:#DA627D fg:#9A348E)"
          "$directory"
          "[](fg:#DA627D bg:#FCA17D)"
          "$git_branch"
          "$git_status"
          "[](fg:#FCA17D bg:#86BBD8)"
          "$python"
          "[](fg:#86BBD8 bg:#06969A)"
          "$docker_context"
          "[](fg:#06969A bg:#33658A)"
          "$time"
          "[ ](fg:#33658A)"
        ];

        directory.substitutions = {
          "/a/b" = "b";
          "/a" = "a";
        };

        username = {
          show_always = true;
          style_user = "";
          style_root = "";
          format = "";
          disabled = false;
        };

        os = {
          format = "";
          style = "";
          disabled = false;
        };

        os.symbols = {
          Linux = " ";
          NixOS = " ";
        };

        directory = {
          style = "";
          format = "";
          truncation_length = 3;
          truncation_symbol = "";
        };

        docker_context = {
          symbol = "";
          style = "bg:#";
          format = "[ $symbol $context ]($style) $path";
        };

        git_branch = {
          symbol = "";
          style = "bg:#";
          format = "[ $symbol $branch ]($style)";
        };

        git_status = {
          style = "bg:#";
          format = "[$all_status$ahead_behind ]($style)";
        };

        python = {
          symbol = "";
          style = "bg:#";
          format = "[ $symbol ($version) ]($style)";
        };

        time = {
          disabled = false;
          time_format = "%R";
          style = "bg:#";
          format = "[  $time ]($style)";
        };

        battery = {
          disabled = false;
          #symbol = "";
          style = "";
          format = "[ $symbol $percentage ]($style)";
        };

        battery.display = { threshold = 30; };

        hostname = { ssh_symbol = ""; };

      };
    };
  };
}
