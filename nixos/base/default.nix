{ lib, pkgs, ... }:
{
  imports = [
    ./ausweisapp.nix
    ./fonts.nix
    ./locale.nix
    ./logs.nix
    ./networking.nix
    ./nix-ld.nix
    ./packages.nix
    ./ssh.nix
    ./nano.nix
  ];
}
