{ config, lib, pkgs, ... }: {
  boot = {
    consoleLogLevel = 3;
    initrd = {
      availableKernelModules = [
        "ahci"
        "nvme"
        "usbhid"
        "usb_storage"
        "sd_mod"
        "xhci_pci"
      ];
      verbose = false;
    };

    # Enable TTYs
    kernelParams = [
      "console=tty1"
    ];

    kernelModules = [
      "kvm-intel"
      "vhost_vsock"
      "nfs-common"
    ];
    kernelPackages = pkgs.linuxPackages_latest;
    supportedFilesystems = [ "btrfs" "vfat" "ntfs" "nfs" "exfat" ];

    loader = {
      efi.canTouchEfiVariables = true;

      grub = {
        enable = true;
        efiSupport = true;
        useOSProber = true;
        device = "nodev";
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
