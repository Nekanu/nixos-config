{ pkgs, ... }:
{
  programs.atuin = {
    enable = true;
    package = pkgs.unstable.atuin;

    enableBashIntegration = true;
    enableFishIntegration = true;
    enableZshIntegration = true;

    settings = {
      update_check = false;
      dialect = "uk";
      style = "auto";
      workspaces = true;
      store_failes = false;
    };
  };
}
