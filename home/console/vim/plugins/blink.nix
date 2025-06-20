{
  programs.nixvim.plugins = {
    blink-cmp-copilot.enable = true;
    blink-cmp-git.enable = true;
    blink-ripgrep.enable = true;

    blink-cmp = {
      enable = true;
      settings = {
        keymap.preset = "super-tab";

        sources = {
          default = [
            "lsp"
            "path"
            "buffer"
            "snippets"
            "copilot"
            "git"
            "copilot"
            "ripgrep"
          ];

          providers = {
            copilot = {
              async = true;
              module = "blink-cmp-copilot";
              name = "copilot";
              score_offset = 100;
            };

            git = {
              module = "blink-cmp-git";
              name = "git";
              score_offset = 100;
              opts = {
                commit = { };
                git_centers = {
                  github = { };
                  gitlab = { };
                };
              };
            };

            ripgrep = {
              async = true;
              module = "blink-ripgrep";
              name = "Ripgrep";
              score_offset = 100;
              opts = {
                prefix_min_len = 3;
                context_size = 5;
                max_filesize = "1M";
                project_root_marker = ".git";
                project_root_fallback = true;
                search_casing = "--ignore-case";
                additional_rg_options = { };
                fallback_to_regex_highlighting = true;
                ignore_paths = { };
                additional_paths = { };
                debug = false;
              };
            };
          };
        };
      };
    };
  };
}
