{ config, lib, pkgs, ... }: {
  boot = {
    consoleLogLevel = 3;

    growPartition = true;
    kernelParams = [ "console=ttyS0" "boot.shell_on_fail" ];

    kernelPackages = pkgs.linuxPackages_6_12;
    supportedFilesystems = [ "ext4" "vfat" ];

    loader.grub = {
      enable = lib.mkForce true;
      device = "nodev";
    };
  };
}
