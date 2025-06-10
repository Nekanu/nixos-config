{ lib, pkgs, ... }:
{
  boot = {
    consoleLogLevel = 3;
    initrd = {
      availableKernelModules = [
        "ahci"
        "nvme"
        "usbhid"
        "usb_storage"
        "sd_mod"
        "thunderbolt"
        "xhci_pci"
      ];
      verbose = false;
    };

    # Enable TTYs
    kernelParams = [ "console=tty1" ];

    kernelModules = [
      "kvm-intel"
      "vhost_vsock"
    ];
    kernelPackages = pkgs.linuxPackages_latest;
    supportedFilesystems = [
      "btrfs"
      "vfat"
    ];

    loader = {
      efi.canTouchEfiVariables = true;

      grub = {
        enable = true;
        efiSupport = true;
        useOSProber = true;
        default = "saved";
      };

      grub2-theme = {
        enable = true;
        theme = "vimix";
        footer = true;
        screen = "1080p";
      };

      timeout = 5;
    };
  };
}
