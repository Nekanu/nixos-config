{ config, ... }:
{
  # Enable V4L2 loopback device and kernel module
  boot.kernelModules = [ "v4l2loopback" ];

  boot.extraModulePackages = with config.boot.kernelPackages; [ v4l2loopback ];

  programs.adb.enable = true; # Android Debug Bridge is used by DroidCam for USB connection

  services.flatpak.packages = [
    "com.obsproject.Studio"
    "com.obsproject.Studio.Plugin.DroidCam"
  ];
}
