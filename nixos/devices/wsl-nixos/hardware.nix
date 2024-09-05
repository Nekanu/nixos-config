{ config, inputs, lib, pkgs, username, modulesPath, ... }:
{
  wsl.enable = true;
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
}
