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
  
  fileSystems."/" = {
    device = "/dev/disk/by-label/System";
    fsType = "btrfs";
    options = [ "subvol=@" ];
  };

  boot.initrd.luks.devices."luks-76561167-a53b-418a-9f75-303a2cbc3c9a".device = "/dev/disk/by-uuid/76561167-a53b-418a-9f75-303a2cbc3c9a";

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/DACA-23A4";
    fsType = "vfat";
  };

  fileSystems."/home" = {
    device = "/dev/disk/by-label/Home";
    fsType = "btrfs";
    mountPoint = "/home";
  };

  boot.initrd.luks.devices."luks-7d36d3d4-2cb8-4f9a-b9ef-2ccf7d59e02d".device = "/dev/disk/by-uuid/7d36d3d4-2cb8-4f9a-b9ef-2ccf7d59e02d";

  swapDevices = [];

  console = {
    enable = true;
  };

  hardware = {
    bluetooth = {
      enable = true;
      powerOnBoot = true;
      settings = {
        General = {
          Experimental = true;
        };
      };
    };

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

    # Disable power-profiles-daemon to avoid conflicts with TLP
    power-profiles-daemon.enable = false;

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
