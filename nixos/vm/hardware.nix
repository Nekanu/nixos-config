{ config, inputs, lib, pkgs, username, ... }:

{
  imports = [
    ../_mixins/base/pipewire.nix
  ];

  # VM disk
  fileSystems."/" = {
    device = "/dev/disk/by-partlabel/root";
    fsType = "ext4";
    autoResize = true;
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-label/boot";
    fsType = "vfat";
  };

  networking.useDHCP = lib.mkDefault true;
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";

  services.qemuGuest.enable = true;
}
