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

  fileSystems."/" =
    {
      device = "/dev/disk/by-label/System";
      fsType = "btrfs";
      options = [ "subvol=@" ];
    };

  boot.initrd.luks.devices."luks-a7794be5-718d-4149-b683-8bf9ca32b643".device = "/dev/disk/by-uuid/a7794be5-718d-4149-b683-8bf9ca32b643";

  fileSystems."/boot" =
    {
      device = "/dev/disk/by-uuid/DACA-23A4";
      fsType = "vfat";
    };

  fileSystems."/home" =
    {
      device = "/dev/disk/by-label/Home";
      fsType = "btrfs";
      mountPoint = "/home";
    };

  boot.initrd.luks.devices."luks-0fd69ca3-b5bb-42df-a27d-484315f71eec".device = "/dev/disk/by-uuid/0fd69ca3-b5bb-42df-a27d-484315f71eec";



  swapDevices = [];

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
