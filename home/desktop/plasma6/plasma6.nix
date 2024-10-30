{ config, lib, pkgs, ... }:
{
  programs.plasma = {
    enable = true;

    workspace = {
      clickItemTo = "select";
    };

    # Enable NumLock on startup
    configFile."kcminputrc".Keyboard.NumLock.value = 0;
  };

  xdg = {
    portal = {
      configPackages = [ pkgs.xdg-desktop-portal-kde ];
      extraPortals = [ pkgs.xdg-desktop-portal-kde ];
    };
  };
}
