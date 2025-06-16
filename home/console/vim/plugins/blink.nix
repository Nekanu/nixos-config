{
  blink-cmp-copilot.enable = true;
  blink-cmp-git.enable = true;

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
        };
      };
    };
  };
}
