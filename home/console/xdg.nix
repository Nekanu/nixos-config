{ config, lib, pkgs, ... }:
{
  home.packages = with pkgs; [
    xdg-desktop-portal
    xdg-desktop-portal-gtk
  ];

  xdg = {
    enable = true;
    userDirs = {
      enable = true;
      createDirectories = lib.mkDefault true;
      extraConfig = {
        XDG_SCREENSHOTS_DIR = "${config.home.homeDirectory}/Pictures/Screenshots";
      };
    };
  };
}
