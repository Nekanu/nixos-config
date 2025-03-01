{ lib, username, ... }:
{
  wsl.enable = true;
  wsl.defaultUser = username;
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
}
