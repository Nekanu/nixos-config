{
  desktopEnvironments,
  lib,
  pkgs,
  ...
}:
{
  imports =
    [
      ../base/pipewire.nix
      ./modules/appimage.nix
      ./modules/ausweisapp.nix
      ./modules/obs.nix
      ./modules/printing.nix
      ./modules/scanning.nix
      ./modules/yubico.nix
      ../../modules/flatpak.nix
      ../../modules/pcloud.nix
    ]
    # Include all desktop environments specified in the `desktopEnvironments` list.
    ++ (map (element: (./. + "/${element}")) desktopEnvironments);

  boot.kernelParams = [ "quiet" ];
  boot.plymouth.enable = true;

  programs.xwayland.enable = true;

  environment.systemPackages = with pkgs; [
    pcloud
    gparted

    xwaylandvideobridge
  ];
}
