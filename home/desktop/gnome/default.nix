{ config, lib, pkgs, ... }:
{
  home.packages = with pkgs; [
    xdg-desktop-portal-gnome
  ];
}
