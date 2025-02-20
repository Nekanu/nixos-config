{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # Logs
    kdePackages.ksystemlog
    gnome-logs
  ];
}
