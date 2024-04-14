{ config, inputs, lib, pkgs, username, ... }:

{
  imports = [
    inputs.nixos-hardware.nixosModules.common-cpu-intel
    inputs.nixos-hardware.nixosModules.common-gpu-intel
    #inputs.nixos-hardware.nixosModules.common-gpu-nvidia
    inputs.nixos-hardware.nixosModules.common-pc
    inputs.nixos-hardware.nixosModules.common-pc-ssd
    ../_mixins/base/pipewire.nix
  ];
  
  boot.initrd.secrets = {
    "/crypto_keyfile.bin" = null;
  };

  # Enable swap on luks
  boot.initrd.luks.devices."luks-41e24345-876e-46b8-b7ad-26990ab75956".device = "/dev/disk/by-uuid/41e24345-876e-46b8-b7ad-26990ab75956";
  boot.initrd.luks.devices."luks-41e24345-876e-46b8-b7ad-26990ab75956".keyFile = "/crypto_keyfile.bin";

  boot.initrd.luks.devices."luks-b3669414-8796-4c07-bea2-aa452d8a31e8".keyFile = "/crypto_keyfile.bin";

  fileSystems."/" =
    {
      device = "/dev/disk/by-label/System";
      fsType = "btrfs";
      options = [ "subvol=@" ];
    };

  fileSystems."/boot" =
    {
      device = "/dev/disk/by-uuid/3560-4CF6";
      fsType = "vfat";
    };

  boot.initrd.luks.devices."luks-1d366276-95f8-49af-8006-87dcd2e74dbd".device = "/dev/disk/by-uuid/1d366276-95f8-49af-8006-87dcd2e74dbd";

  fileSystems."/home" =
    {
      device = "/dev/disk/by-label/Home";
      fsType = "btrfs";
      mountPoint = "/home";
    };

  boot.initrd.luks.devices."luks-b3669414-8796-4c07-bea2-aa452d8a31e8".device = "/dev/disk/by-uuid/b3669414-8796-4c07-bea2-aa452d8a31e8";

  swapDevices = [
    { device = "/dev/disk/by-uuid/9ce7fee2-672f-45fb-90d7-df6e53f8396f"; }
  ];

  console = {
    enable = true;
  };

  hardware = {
    opengl = {
      enable = true;
      driSupport = true;
      driSupport32Bit = true;
    };

    # TUXEDO Laptop
    tuxedo-keyboard.enable = true;
    tuxedo-control-center.enable = true;
  };

  services.fwupd.enable = true;

  networking.useDHCP = lib.mkDefault true;
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
