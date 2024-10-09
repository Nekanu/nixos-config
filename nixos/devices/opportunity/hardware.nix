{ config, inputs, lib, pkgs, username, ... }:

{
  imports = [
    inputs.nixos-hardware.nixosModules.common-cpu-intel
    inputs.nixos-hardware.nixosModules.common-pc
    inputs.nixos-hardware.nixosModules.common-pc-ssd
  ];
  
  fileSystems."/" =
    { device = "/dev/disk/by-uuid/e047f27b-d68c-4632-94f0-3dd374497262";
      fsType = "btrfs";
      options = [ "subvol=@" ];
    };

  boot.initrd.luks.devices."luks-76879fa9-8887-49d5-9d92-20e764a13d7c".device = "/dev/disk/by-uuid/76879fa9-8887-49d5-9d92-20e764a13d7c";

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/35C7-919C";
      fsType = "vfat";
      options = [ "fmask=0022" "dmask=0022" ];
    };


  swapDevices = [];

  console = {
    enable = true;
  };

  hardware = {
    bluetooth = {
      enable = true;
      # powerOnBoot = true;
      settings = {
        General = {
          Experimental = true;
        };
      };
    };

    graphics = {
      enable = true;
    };

    # TUXEDO Laptop
    # tuxedo-keyboard.enable = true;
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
    power-profiles-daemon.enable = true;

    tlp = {
      enable = false;
      settings = {
        CPU_SCALING_GOVERNOR_ON_AC = "performance";
        CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

        CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
        CPU_ENERGY_PERF_POLICY_ON_AC = "performance";

        CPU_MIN_PERF_ON_AC = 0;
        CPU_MAX_PERF_ON_AC = 100;
        CPU_MIN_PERF_ON_BAT = 0;
        CPU_MAX_PERF_ON_BAT = 50;

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
