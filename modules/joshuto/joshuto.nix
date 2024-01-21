{ config, lib, pkgs, ... }:

{
  home-manager.users.phonon = { pkgs, ... }: {
    home.stateVersion = "22.11";

    xdg.desktopEntries.joshuto = {
      name = "joshuto";
      genericName = "Files";
      exec = "joshuto";
      terminal = true;
      categories = [ "Application" "System" ];
    };

    programs.joshuto = {
      enable = true;
      # pkgs = pkgs.joshuto;
      # keymap = { };
      settings = {
        display = {
          show_hidden = true;
          show_icons = true;
          line_number_style = "relative";
          collapse_preview = true;
          column_ratio = [ 1 4 4 ];
          scroll_offset = 6;
          show_borders = true;
          line_mode = "size";
          sort = {
            sort_method = "natural";
            case_sensitive = false;
            directories_first = true;
            reverse = false;
          };
        };
      };
      # theme = { };
      mimetype = {
        class = {
          image_default = [{
            command = "vimiv";
            args = [ "--" ];
            fork = true;
            silent = true;
          }];
          text_default = [{
            command = "emacs-client";
            args = [ "-nc" ];
            fork = true;
            silent = true;
          }];
          reader_default = [{
            command = "zathura";
            fork = true;
            silent = true;
          }];
        };
        extension = {
          ## image formats
          avif."inherit" = "image_default";
          bmp."inherit" = "image_default";
          gif."inherit" = "image_default";
          heic."inherit" = "image_default";
          jpeg."inherit" = "image_default";
          jpe."inherit" = "image_default";
          jpg."inherit" = "image_default";
          pgm."inherit" = "image_default";
          png."inherit" = "image_default";
          ppm."inherit" = "image_default";
          webp."inherit" = "image_default";

          ## audio formats
          flac."inherit" = "audio_default";
          m4a."inherit" = "audio_default";
          mp3."inherit" = "audio_default";
          ogg."inherit" = "audio_default";
          wav."inherit" = "audio_default";

          ## video formats
          avi."inherit" = "video_default";
          av1."inherit" = "video_default";
          flv."inherit" = "video_default";
          mkv."inherit" = "video_default";
          m4v."inherit" = "video_default";
          mov."inherit" = "video_default";
          mp4."inherit" = "video_default";
          webm."inherit" = "video_default";
          wmv."inherit" = "video_default";

          ## text formats
          build."inherit" = "text_default";
          c."inherit" = "text_default";
          cmake."inherit" = "text_default";
          conf."inherit" = "text_default";
          cpp."inherit" = "text_default";
          css."inherit" = "text_default";
          csv."inherit" = "text_default";
          cu."inherit" = "text_default";
          ebuild."inherit" = "text_default";
          eex."inherit" = "text_default";
          env."inherit" = "text_default";
          ex."inherit" = "text_default";
          exs."inherit" = "text_default";
          go."inherit" = "text_default";
          h."inherit" = "text_default";
          hpp."inherit" = "text_default";
          hs."inherit" = "text_default";
          html."inherit" = "text_default";
          ini."inherit" = "text_default";
          java."inherit" = "text_default";
          js."inherit" = "text_default";
          json."inherit" = "text_default";
          kt."inherit" = "text_default";
          lock."inherit" = "text_default";
          lua."inherit" = "text_default";
          log."inherit" = "text_default";
          md."inherit" = "text_default";
          micro."inherit" = "text_default";
          ninja."inherit" = "text_default";
          py."inherit" = "text_default";
          rkt."inherit" = "text_default";
          rs."inherit" = "text_default";
          scss."inherit" = "text_default";
          sh."inherit" = "text_default";
          srt."inherit" = "text_default";
          svelte."inherit" = "text_default";
          toml."inherit" = "text_default";
          ts."inherit" = "text_default";
          tsx."inherit" = "text_default";
          txt."inherit" = "text_default";
          vim."inherit" = "text_default";
          xml."inherit" = "text_default";
          yaml."inherit" = "text_default";
          yml."inherit" = "text_default";

          pdf."inherit" = "reader_default";
          epub."inherit" = "ebook_default";
        };
      };
    };

  };
}
