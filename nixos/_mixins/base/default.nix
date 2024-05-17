{ lib, pkgs, ... }: {
  imports = [
    ./fonts.nix
    ./locale.nix
    ./networking.nix
    ./packages.nix
    ./ssh.nix
    ./nano.nix
  ];
}
