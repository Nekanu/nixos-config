{ pkgs, ... }:
{

  services.ollama = {
    enable = true;
    package = pkgs.unstable.ollama;
  };

  programs.zed-editor = {
    enable = true;
    package = pkgs.unstable.zed-editor;

    extensions = [
      "nix"
      "html"
      "dockerfile"
      "docker-compose"
      "intellij-newui-theme"
    ];

    userSettings = {
      telemetry = {
        metrics = false;
        diagnostics = false;
      };

      show_whitespaces = "all";

      base_keymap = "VSCode";

      ui_font_size = 16;
      buffer_font_size = 16;
      tab_size = 2;
      theme = {
        mode = "system";
        light = "Ayu Light";
        dark = "Ayu Dark";
      };

      icon_theme = {
        mode = "system";
        light = "JetBrains New UI Icons (Light)";
        dark = "JetBrains New UI Icons (Dark)";
      };

      vim_mode = false;

      load_direnv = "direct";

      autosave = "on_focus_change";
      restore_on_startup = "last_workspace";
      tabs = {
        git_status = true;
        file_icons = true;
        collaboration_panel = {
          dock = "right";
        };
      };

      assistant = {
        default_model = {
          provider = "ollama";
          model = "mistral:latest";
        };
        version = "2";
      };

      terminal = {
        dock = "bottom";
        copy_on_select = false;
      };

      lsp = {
        nix = {
          binary = {
            path_lookup = true;
          };
        };
      };
    };
  };
}
