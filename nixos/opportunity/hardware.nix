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
    tuxedo-rs = {
      enable = true;
      tailor-gui.enable = true;
    };
  };

  # Power Management

  powerManagement = {
    enable = true;
    cpuFreqGovernor = "powersave";
  };

  services = {
    fwupd.enable = true;

    thermald.enable = true;

    tlp = {
      enable = true;
      settings = {
        CPU_SCALING_GOVERNOR_ON_AC = "performance";
        CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

        CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
        CPU_ENERGY_PERF_POLICY_ON_AC = "performance";

        CPU_MIN_PERF_ON_AC = 0;
        CPU_MAX_PERF_ON_AC = 100;
        CPU_MIN_PERF_ON_BAT = 0;
        CPU_MAX_PERF_ON_BAT = 30;

        #Optional helps save long term battery health
        START_CHARGE_THRESH_BAT0 = 50;
        STOP_CHARGE_THRESH_BAT0 = 85;
      };
    };
  };

  networking.useDHCP = lib.mkDefault true;
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
