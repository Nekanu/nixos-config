{
  config,
  inputs,
  lib,
  ...
}:
{
  imports = [
    inputs.nixos-hardware.nixosModules.common-cpu-intel
    inputs.nixos-hardware.nixosModules.common-gpu-amd
    inputs.nixos-hardware.nixosModules.common-pc
    inputs.nixos-hardware.nixosModules.common-pc-ssd
  ];

  fileSystems."/mnt/Games1" = {
    device = "/dev/disk/by-label/Games1";
    fsType = "btrfs";
    options = [
      "exec"
      "rw"
      "nofail"
    ];
  };

  fileSystems."/mnt/Games3" = {
    device = "/dev/disk/by-label/Games3";
    fsType = "btrfs";
    options = [
      "exec"
      "rw"
      "nofail"
    ];
  };

  # TODO: Re-add if NAS is working
  # fileSystems."/mnt/fortune" = {
  #   device = "fortune.local:/mnt/main/nekanu";
  #   fsType = "nfs";
  #   options = [
  #     "noexec"
  #     "rw"
  #     "nofail"
  #   ];
  # };

  console.enable = true;

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  hardware.amdgpu = {
    opencl.enable = true;

    amdvlk = {
      enable = true;
      supportExperimental.enable = true;
      support32Bit.enable = true;
    };
  };

  hardware.bluetooth.enable = true;

  services.fwupd.enable = true;

  networking = {
    useDHCP = lib.mkDefault true;

    networkmanager = {
      enable = true;
    };
  };

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;

  programs.bazecor.enable = true; # Dygma Keyboard configurator
}
