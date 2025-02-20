{ pkgs, ... }:
{
  imports = [
    # ./hyprland.nix
  ];

  home.packages = with pkgs; [
    # Terminal
    kitty
    # File Manager
    xfce.thunar

    #xdg-desktop-portal-hyprland

    hyprpaper # wallpaper
    hyprdim # dim inactive windows
    hyprshot # screenshot
    hyprlock # lockscreen
    hyprkeys # keybinds
    hypridle # idle daemon
    hyprpicker # color picker
    hyprcursor # cursor theme
    hyprland-workspaces # workspaces
    hyprlandPlugins.hyprbars
    hyprlandPlugins.hyprexpo

    grimblast # screenshot
    cliphist # clipboard
    waybar
  ];
}
