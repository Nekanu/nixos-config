{ config, inputs, lib, pkgs, username, ... }:

{
  imports = [
    inputs.nixos-hardware.nixosModules.common-cpu-intel
    inputs.nixos-hardware.nixosModules.common-gpu-intel
    inputs.nixos-hardware.nixosModules.common-gpu-amd
    inputs.nixos-hardware.nixosModules.common-pc
    inputs.nixos-hardware.nixosModules.common-pc-ssd
    ../_mixins/base/pipewire.nix
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
      mountPoint = "/home";
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

  boot.initrd.luks.devices."luks-c74aec2a-b836-4b0c-91e2-8247e09b3a03".device = "/dev/disk/by-uuid/c74aec2a-b836-4b0c-91e2-8247e09b3a03";

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
    opengl = {
      enable = true;
      driSupport = true;
      driSupport32Bit = true;
    };
  };

  services.fwupd.enable = true;

  networking.useDHCP = lib.mkDefault true;
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
