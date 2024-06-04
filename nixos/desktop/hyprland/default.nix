{ pkgs, ... }:
{
  programs.hyprland = {
    enable = true;

    xwayland.enable = true;
  };

  environment.systemPackages = with pkgs; [
    kitty
    xdg-desktop-portal-hyprland
  ];
}
