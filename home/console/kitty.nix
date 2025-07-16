{ pkgs, ... }:
{
  programs.kitty = {
    enable = true;
    package = pkgs.kitty;
  };

  # home.file.".config/kitty/kitty.conf".source = ./kitty.conf;
}
