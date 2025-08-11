{
  desktopEnvironments,
  pkgs,
  ...
}:
{
  imports = [
    ./modules
    ../../modules/flatpak.nix
  ]
  # Include all desktop environments specified in the `desktopEnvironments` list.
  ++ (map (element: (./. + "/${element}")) desktopEnvironments);

  boot.kernelParams = [
    "quiet"
    "loglevel=2"
    "splash"
    "boot.shell_on_fail"
    "udev.log_priority=3"
    "rd.systemd.show_status=auto"
  ];

  boot.initrd.verbose = false;
  boot.initrd.systemd.enable = true;
  boot.plymouth = {
    enable = true;
  };

  programs.xwayland.enable = true;

  environment.systemPackages = with pkgs; [
    gparted
    kdePackages.xwaylandvideobridge
  ];
}
