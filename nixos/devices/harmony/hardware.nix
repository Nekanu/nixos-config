{ config, inputs, lib, pkgs, username, ... }:

{
  imports = [
    inputs.nixos-hardware.nixosModules.common-cpu-intel
    inputs.nixos-hardware.nixosModules.common-gpu-amd
    inputs.nixos-hardware.nixosModules.common-pc
    inputs.nixos-hardware.nixosModules.common-pc-ssd
  ];

  fileSystems."/" =
    {
      device = "/dev/disk/by-label/System";
      fsType = "btrfs";
      options = [ "subvol=@" ];
    };

  fileSystems."/boot" =
    {
      device = "/dev/disk/by-label/BOOT";
      fsType = "vfat";
    };

  fileSystems."/home" =
    {
      device = "/dev/disk/by-label/Home";
      fsType = "btrfs";
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

  console = {
    enable = true;
  };

  hardware = {
    graphics = {
      enable = true;
    };
  };

  services.fwupd.enable = true;

  networking = {
    useDHCP = lib.mkDefault true;
    
    networkmanager = {
      enable = true;
      insertNameservers = ["192.168.178.8"];
    };
  };

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
