{
  desktopEnvironments,
  pkgs,
  ...
}:
{
  imports =
    [
      ./modules/appimage.nix
      ./modules/ausweisapp.nix
      ./modules/vpn.nix
      ./modules/obs.nix
      ./modules/pipewire.nix
      ./modules/printing.nix
      ./modules/scanning.nix
      ./modules/yubico.nix
      ../../modules/flatpak.nix
    ]
    # Include all desktop environments specified in the `desktopEnvironments` list.
    ++ (map (element: (./. + "/${element}")) desktopEnvironments);

  boot.kernelParams = [ 
    "quiet" 
    "splash"
    "boot.shell_on_fail"
    "udev.log_priority=3"
    "rd.systemd.show_status=auto"
  ];
  
  boot.plymouth = {
    enable = true;
    theme = "black_hud";
    themePackages = with pkgs; [
      # By default we would install all themes
      (adi1090x-plymouth-themes.override {
        selected_themes = [ "black_hud" ];
      })
    ];
  };

  programs.xwayland.enable = true;

  environment.systemPackages = with pkgs; [
    pcloud
    gparted

    kdePackages.xwaylandvideobridge
  ];
}
