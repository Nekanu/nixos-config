{
  config,
  lib,
  pkgs,
  ...
}:
{
  programs.plasma = {
    # enable = true;
  };

  xdg = {
    portal = {
      configPackages = [ pkgs.xdg-desktop-portal-kde ];
      extraPortals = [ pkgs.xdg-desktop-portal-kde ];
    };
  };
}
