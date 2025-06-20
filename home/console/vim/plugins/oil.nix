{
  programs.nixvim.plugins = {
    oil = {
      enable = true;
      settings = {
        win_options = {
          signcolumn = "yes:2";
        };
      };
    };
    oil-git-status.enable = true;
  };
}
