{ config, pkgs, ... }: {
  # Enable V4L2 loopback device and kernel module
  boot.kernelModules = [ "v4l2loopback" ];

  boot.extraModulePackages = with config.boot.kernelPackages; [ v4l2loopback ];

  environment.systemPackages = with pkgs; [
    android-tools # ADB is used for USB bridging in DroidCam OBS
  ];

  services.flatpak.packages = [
    "com.obsproject.Studio"
    "com.obsproject.Studio.Plugin.DroidCam"
  ];
}
